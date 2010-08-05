class ListController < Controller

    def index
        @title = "Peterstone List"
        @headings = ['Code', 'Species Name', 'First Date', 'Observer' ]
        @sightings = Observation.first_observations
    end

end
