class ListController < Controller

    def initialize
        @isodd = false
    end

    def index
        @title = "Peterstone List"
        @headings = ['Code', 'Species Name', 'First Date', 'Observer' ]
        @sightings = Observation.first_observations
    end

    def cycle
        (@isodd = !@isodd) ? 'even' : 'odd'
    end

end
