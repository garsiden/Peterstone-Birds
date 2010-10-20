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
end
