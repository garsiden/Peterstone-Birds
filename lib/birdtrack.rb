require 'rubygems'
require 'patron'
require 'nokogiri'
require 'sequel'

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
        subs_list = []

        (table/('tr'))[1 .. -1].each do |tr| 
            url, start_time, end_time, site_name = tr/('td')
            link = (url/('a'))[0]
            next unless link['href'] =~ /(SUB[W]?\d+)/;
            sub_id = $1
            next unless link.inner_text =~ /(\d{2} [A-Z][a-z]{2} \d{4})/ 
                list_date = $1
            sub_item = {
                :sub_id     => sub_id,
                :site_name  => site_name.inner_text.strip,
                :list_date  => list_date,
                :start_time => start_time.inner_text.strip,
                :end_time   => end_time.inner_text.strip
            }
            subs_list.push sub_item
        end

        subs_list
    end

    def BirdTrack.get_new_subs year, web_subs
        # array of sub_ids from database
        db = self.db_connect
        db_subs = db[:lists].
            filter("date_part('year', list_date)=?", year).
            select_order_map(:sub_id)

        # create hash of sub_ids
        seen = Hash[*db_subs.map { |v| [v, nil] }.flatten]

        # compare to BirdTrack sourced lists
        updates = web_subs.select { |s| not seen.has_key? s[:sub_id] }

        puts "DB subs: #{db_subs.count}\nBT subs: #{web_subs.count}\nDiff: #{updates.length}"

        updates
    end

    def BirdTrack.add_db_list updates

        return nil if updates.empty?
        bto = self.get_bto_codes
        db = self.db_connect

        # add BTO codes to obs hash
        updates.each do |sub|
            sub[:obs].each do |ob|
                ob[:bto_code] = bto[ob[:species]]
                ob[:sub_id] = sub[:sub_id]
                ob.delete :species
            end 
            db.transaction do
                db[:lists].insert(
                    :sub_id     => sub[:sub_id],
                    :list_date  => sub[:list_date],
                    :start_time => sub[:start_time],
                    :end_time   => sub[:end_time]
                )
                db[:sightings].multi_insert(sub[:obs])
            end
            puts "Added list #{sub[:sub_id]} to the database"
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

    def BirdTrack.process_subs_lists subs, obs_src, get_html_method

        subs.each do |s|
            #src = obs_src
            src = obs_src.sub(/SUBID/, s[:sub_id])
            html = get_html_method.call src
            s[:obs] = self.parse_obs_list html 
        end

        self.add_db_list subs
    end
end
