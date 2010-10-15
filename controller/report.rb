class ReportController < Controller

    layout 'report_layout'

    def initialize
        @last_updated = Report.last_updated
        super
    end

    def first_observations
        @title += " - First Observations"
        @caption = 'First Observations'
        ds  = Report.first_observations
        cols = ds.columns
        @headings = cols.values_at(1, -9 .. 11).map { |h| h.to_s.capitalize }
        @years = cols[-9 .. 9]
        @results = ds.all
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

        ds = Report.wintering
        winter = ds.all
        cols = ds.columns
        @headings = cols[ 2 .. -1].map { |h| h.to_s.capitalize }
        @months = cols[3 .. -2]

        @results = Array.new

        codes.sort.each do |c|
            @results.push( winter.select { |w| w[:bto_code] == c } )
        end
    end

    def hotspot
        @title += " - Hotspot"
        @caption = 'Hotspot'
        ds  = Report.hotspot
        cols = ds.columns
        @headings = cols.map { |h| h.to_s.capitalize }
        @years = cols[1 .. -1]
        @results = ds.all
    end

    private

    def fmt_date dt, fmt="%d %b"
        dt.strftime(fmt) if dt
    end
end
