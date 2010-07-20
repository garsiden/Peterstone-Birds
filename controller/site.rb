class SiteController < Controller

    def initialize
        @isodd = false
        @title = "Sites"
    end

    def index
        @sites = Site
        @headers = %w[ Id Name Region ]
    end

    def cycle
        (@isodd = !@isodd) ? 'even' : 'odd'
    end
end
