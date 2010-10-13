class ReportController < Controller

    layout 'report_layout'

    def initialize
        @last_updated = Report.last_updated
        super
    end

    def first_observations
        @title += " - First Observations"
        ds  = Report.first_observations
        cols = ds.columns
        @headings = cols.values_at(1, -9 .. 11).map { |h| h.to_s.capitalize }
        @years = cols[-9 .. 9]
        @first_obs = ds.all
    end

    def winter_wildfowl
        @caption = "Winter Wildfowl" 
        @title + " - " + @caption
        ds = Report.winter_wildfowl
        @wildfowl = ds.filter(:bto_code => "RK")
        cols = ds.columns
        @headings = cols[ 1 .. 11].map { |h| h.to_s.capitalize }
        #@headings = heads[ 1 .. 11]
    end

    private

    def fmt_date dt, fmt="%d %b"
        dt.strftime(fmt) if dt
    end
end
