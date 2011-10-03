require 'rubygems'
require 'patron'
require 'nokogiri'
require 'sequel'
require 'set'

module BirdTrack

    BASE_URL = "http://blx1.bto.org/birdtrack/"
    SUBS_URL = 'observations/list-submissions.jsp?'
    OBS_URL =
        'observations/list-observations.jsp?SubmissionID='\
        'SUBID&YEAR=YYYY&SORT=A'
    AUTH_URL =
        'servlet/AuthenticateUser?'\
        'SuccessURL=/birdtrack/main/data-home.jsp&'\
        'FailureURL=/birdtrack/login/login.html'
    AGENT  = 
        'Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10.4; en-US; rv:1.9.2.10) '\
        'Gecko/20100914 Firefox/3.6.10'

    @@bto = {}
    @@sess = nil
    @@dbc = nil

    def self.db_connect database_url = nil
        url = database_url || ENV['DATABASE_URL']
        @@dbc = Sequel.connect(url) if @@dbc == nil
        @@dbc
    end

    def self.bto_logon cookie = nil
        unless @@sess
            cookie = cookie || ENV['BTO_COOKIE']
            sess = Patron::Session.new
            sess.timeout = 10
            sess.base_url = BASE_URL
            sess.handle_cookies
            resp = sess.head(AUTH_URL,
                             {'User-Agent' => AGENT, 'Cookie' => cookie})
            puts resp.status
            @@sess = sess
        end
        @@sess
    end

    def BirdTrack.get_bto_codes
        if @@bto.empty?
            db = self.db_connect
            @@bto = db[:web_species_lookup].select_hash(:name, :bto_code)
        end
        @@bto
    end

    def BirdTrack.get_subs_list subs_src, get_subs_method
        doc = get_subs_method.call(subs_src)
        parse_subs_list doc
    end

    def BirdTrack.parse_obs_list doc
        table = doc.at('//table[@id="stripeTable"]')
        obs_list = []

        (table/('tr'))[1 .. -1].each do |tr| 
            species, count = (tr/('td'))[0..1].map { |x| x.inner_text.strip }
            next unless count
            next if (species =~ /^Terns|Number/)
            (count =~ /(^c?)(\d*,?\d*)([+]?$)/)
            unless (num = $2).empty?
                prefix = $1
                suffix = $3
                qualifier = prefix.empty? ? (suffix.empty? ? nil : suffix ) : prefix
                num.sub!(',','')
            else
                num = '-1'
                qualifier = 'p'
            end
            obs_item = {
                :species       => species,
                :species_count => num,
                :qualifier     => qualifier
            }
            obs_list.push obs_item
        end

        obs_list
    end

    def BirdTrack.parse_subs_list doc
        table = doc.at('//table[@id="any"]')
        subs_list = {}

        (table/('tr'))[1 .. -1].each do |tr| 
            url, start_time, end_time, site_name = tr/('td')
            link = (url/('a'))[0]
            next unless link['href'] =~ /(SUB[W]?\d+)/;
            sub_id = $1
            next unless link.inner_text =~ /(\d{2} [A-Z][a-z]{2} \d{4})/ 
                list_date = $1
            sub_item = {
                :site_name  => site_name.inner_text.strip,
                :list_date  => list_date,
                :start_time => start_time.inner_text.strip,
                :end_time   => end_time.inner_text.strip
            }
            subs_list[sub_id] = sub_item
        end

        subs_list
    end

    def BirdTrack.get_new_subs year, web_subs
        db = self.db_connect
        db_set = db[:lists].
            filter("date_part('year', list_date)=?", year).
            select_map(:sub_id).to_set

        web_set = web_subs.keys.to_set
        updates = web_set - db_set
        deletes = db_set - web_set

        puts "DB subs: #{db_set.count}\nBT subs: #{web_set.count}\nDiff: #{updates.length}"
        puts "Deletes: #{deletes.length}"

        new = updates.inject({}) do |hash, value|
            hash[value] = web_subs[value]
            hash
        end

        return deletes.to_a, new
    end

    def BirdTrack.add_db_list updates

        return nil if updates.empty?
        bto = self.get_bto_codes
        db = self.db_connect

        # add BTO codes to obs hash
        updates.each do |key,sub|
            sub[:obs].each do |ob|
                ob[:bto_code] = bto[ob[:species]]
                ob[:sub_id] = key
                ob.delete :species
            end 
            db.transaction do
                db[:lists].insert(
                    :sub_id     => key,
                    :list_date  => sub[:list_date],
                    :start_time => sub[:start_time],
                    :end_time   => sub[:end_time]
                )
                db[:sightings].multi_insert(sub[:obs])
            end
            puts "Added list #{key} to the database"
        end
    end

    def BirdTrack.get_web_file path
        doc = open(path) { |f| Nokogiri::HTML(f) }
    end

    def BirdTrack.get_web_page page
        sess = self.bto_logon
        resp = sess.get(page)
        html = resp.body
        doc = Nokogiri::HTML(html)
    end

    def BirdTrack.process_subs_lists deletes, new, obs_src, get_html_method

        new.each do |key, sub|
            src = obs_src.sub(/SUBID/, key)
            html = get_html_method.call src
            sub[:obs] = self.parse_obs_list html 
        end

        self.delete_db_list deletes
        self.add_db_list new
    end

    def BirdTrack.delete_db_list deletes
        return nil if deletes.empty?
        db = self.db_connect
        db[:lists].filter(:sub_id => deletes).delete
    end
end
