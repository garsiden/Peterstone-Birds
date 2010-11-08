require 'yaml'
require 'pp'

class ListController < Controller

    helper :aspect
    
    before (:by_user) {login_first}

    def index
        @title += " - List"
        @headings = ['Code', 'Species Name', 'First Date', 'Observer' ]
        @ds = Observation.first_observations
        n = @ds.count
        @caption = "Peterstone List  (#{n} species)"
        @footer = "Total Species:  #{n}"
    end
    
    def complete
        @title += " - Complete"
        @headings = ['Code', 'Species Name', 'First Date', 'Observer' ]
        @ds = Observation.complete
        n = @ds.count
        @caption = "Complete List  (#{n} species)"
        @footer = "Total Species: #{n}"
    end  

    def rarities
        @title  += " - Rarities"
        @caption = 'Rarities'
        @headings = ['Species Name', 'Date', 'Note' ]
        @ds = Sequel::Model::User['BG'].my_list
        @footer = "Total Species:  #{@ds.count}"
    end

    def daily 
        sub_id = request[:sub_id]
        @title += ' - BirdTrack List'
        @headings = %w[ Code Species Count ]
        list = List[sub_id]
        @caption = "Daily List #{list[:list_date].strftime('%d %B %Y')}"
        @ds = list.sightings_dataset.eager(:bird).order(:bto_code)
    end

    def bewick
        @bewick = YAML::load_file 'yaml/bewick.yaml'
        @title += " Bewick's Species Names"
        @caption = "Bewick's Species' Names"
        @headings = %w[ Bewick Linnaeus Buffon ]
    end

    def by_user
        @title += ' - List by Observer'
        @caption = 'List by Observer'
        @headings = [ 'Species']
        @ds = List::by_user

        # calculate totals
        @totals = {}
        @ds.columns.map { |c| @totals[c.to_s] = 0 if c.to_s =~ /^[a-z]{2}$/ }
        @ds.each do |row|
            @totals.each_key { |k| @totals[k] += 1 if row[k.to_sym] }
        end

        @totals.keys.sort.each { |k| @headings << k.upcase }
        @headings << 'First Date'
    end

    private

    def count_text count, q
        case q
        when '+' then "#{count}#{q}"
        when 'p' then 'present'
        when 'c' then "<i>c</i> #{count}"
        else count
        end
    end
end
