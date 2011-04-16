require 'yaml'

class ReportController < Controller

    layout 'nomenu_layout'

    def index
        @title += "- Reports"
        @caption = 'Reports'
        @reports = YAML::load_file(ENV['YAML_PATH'] + '/reports.yaml')
        # exclude hotspot for now
        @reports.reject!{ |r| r['link'] == 'hotspot' }
    end

    def first_observations
        @title += " - First Observations"
        @caption = 'First Observations'
        ds  = Report.first_observations
        @array = ds.all
        cols = ds.columns
        @headings = cols.values_at(1, -9 .. -1).map { |h| h.to_s.capitalize }
        @years = cols[-9 .. -3]
    end

    def wintering group
        waders= %w[ OC BW RK GV KN DN RP BA L ]
        wildfowl = %w[ SU PT SV WN T ]
        thrushes = %w[ B ST FF RE M ]
        waterpipit = %w[ WI ]

        codes = case group
                when 'waders' 
                    @title + " - Winter Waders"
                    waders
                when 'wildfowl'
                    @title + " - Winter Wildfowl"
                    wildfowl
                when 'waterpipit'
                    @title + " - Water Pipits"
                    waterpipit 
                when 'thrushes'
                    @title += ' - Winter Thrushes'
                    thrushes
                end

        ds = Report.wintering
        winter = ds.all
        cols = ds.columns
        @headings = cols[ 2 .. -1].map { |h| h.to_s.capitalize }
        @months = cols[3 ... -1]
        @arr = []

        codes.sort.each do |c|
            @arr.push( winter.select { |w| w[:bto_code] == c } )
        end
    end

    def hotspot
        @title += " - Hotspot"
        @caption = 'Hotspot'
        ds  = Report.hotspot
        @arr = ds.all
        cols = ds.columns
        @headings = cols.map { |h| h.to_s.capitalize }
        @years = cols[1 .. -1]
    end

    private

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
