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
        @title + " - Winter Wildfowl"
        ds = Report.winter_wildfowl
        wildfowl = ds.all
        cols = ds.columns
        @headings = cols[ 3 .. -1].map { |h| h.to_s.capitalize }
        @months = cols[4 .. -2]

        @result = Array.new
        codes = %w[ GV PT SV BW BA L ]

        codes.sort.each do |c|
            @result.push( wildfowl.select { |w| w[:bto_code] == c } )
        end
    end

    private

    def fmt_date dt, fmt="%d %b"
        dt.strftime(fmt) if dt
    end
end
