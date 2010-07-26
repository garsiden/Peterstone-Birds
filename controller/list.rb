class ListController < Controller

    def initialize
        @isodd = false
    end

    def index
        @title = "Peterstone List"
        @headings = ['Code', 'Species Name', 'First Date', 'Observer' ]
        obs = Observation.eager(:bird).order(:bto_code, :first_date)

        @sightings = Array.new
        bto = nil
        obs.each {|o| if o.bto_code != bto then @sightings << o; bto = o.bto_code end}
        @sightings.sort! {|a,b| b.first_date <=> a.first_date } 
    end

    def cycle
        (@isodd = !@isodd) ? 'even' : 'odd'
    end

end
