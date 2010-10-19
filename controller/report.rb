class ReportController < Controller
    require 'yaml'

    layout 'report_layout'

    def index
        @title += "- Reports"
        @caption = 'Reports'
        @reports = YAML::load_file('yaml/reports.yaml')
        # exclude hotspot for now
        @reports.reject!{ |r| r['link'] == 'hotspot' }
    end

    def first_observations
        @title += " - First Observations"
        @caption = 'First Observations'
        ds  = Report.first_observations
        @results = ds.all
        cols = ds.columns
        @headings = cols.values_at(1, -9 .. 11).map { |h| h.to_s.capitalize }
        @years = cols[-9 .. 9]
    end

    def wintering group

        all = %w[ SU PT SV WN T OC BW RK GV KN DN RP BA L WI ]

        if group == 'waders'
            codes = all[all.index('OC') ... -1]
            @title + " - Winter Waders"
        elsif group == 'wildfowl'
            codes = all[0 ... all.index('OC')]
            @title + " - Winter Wildfowl"
        else group == 'waterpipit'
            codes = all[-1, 1]
        end

        ds = Report.wintering
        winter = ds.all
        cols = ds.columns
        @headings = cols[ 2 .. -1].map { |h| h.to_s.capitalize }
        @months = cols[3 ... -1]
        @results = Array.new

        codes.sort.each do |c|
            @results.push( winter.select { |w| w[:bto_code] == c } )
        end
    end

    def hotspot
        @title += " - Hotspot"
        @caption = 'Hotspot'
        ds  = Report.hotspot
        @results = ds.all
        cols = ds.columns
        @headings = cols.map { |h| h.to_s.capitalize }
        @years = cols[1 .. -1]
    end

    private

    def fmt_date dt, fmt="%d %b"
        dt.strftime(fmt) if dt
    end
    
    def breadcrumb path
        path =~ /(\w+$)/
        mapping = path.sub(/^\/report\//, '')
        text = mapping.gsub(/\/|_/, ' ').gsub(/\b./) { |m| m.upcase }
        bread = []
        bread << anchor('Home', MainController.r('/'))
        bread << anchor('Reports', '/')
        bread << anchor(text, mapping)
        bread.join(' >> ')
    end

    def last_updated
        "Last updated: #{fmt_date Report.last_updated, "%d %B %Y"}" 
    end
end
