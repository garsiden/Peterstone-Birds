require 'yaml'

class ListController < Controller

    def index
        @title += " - Full List"
        @headings = ['Code', 'Species Name', 'First Date', 'Observer' ]
        @sightings = Observation.first_observations
    end

    def rarities
        user = Sequel::Model::User[:user_id => 'BG']
        @title += " - Rarities"
        @headings = ['Species Name', 'Date', 'Note' ]
        @sightings = user.my_list
    end

    def daily 
        sub_id = request[:sub_id]
        @headings = %w[ Code Species Count ]
        @title += ' - BirdTrack List'
        @list = List[:sub_id => sub_id]
        @daily = @list.sightings_dataset.eager(:bird).order(:bto_code.asc)
    end

    def bewick
        @bewick = YAML::load_file 'yaml/bewick.yaml'
        @headings = %w[ Bewick Linnaeus Buffon ]
        @title += " Bewick's List"
    end

    private

    def count_text count, q
        case
        when q == '+' then "#{count}#{q}"
        when q == 'p' then 'present'
        when q == 'c' then "<i>c</i> #{count}"
        else count
        end
    end
end
