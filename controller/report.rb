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

    def wintering group

        if group == 'waders'
            codes = %w[ GV BW BA L]
            @title + " - Winter Waders"
        elsif group == 'wildfowl'
            codes = %w[ SV PT SU ]
            @title + " - Winter Wildfowl"
        elsif group == 'waterpipit'
            codes = %w[ WI]
        end

        ds = Report.winter_wildfowl
        wildfowl = ds.all
        cols = ds.columns
        @headings = cols[ 2 .. -1].map { |h| h.to_s.capitalize }
        @months = cols[3 .. -2]

        @result = Array.new

        codes.sort.each do |c|
            @result.push( wildfowl.select { |w| w[:bto_code] == c } )
        end
    end

    private

    def fmt_date dt, fmt="%d %b"
        dt.strftime(fmt) if dt
    end
end
