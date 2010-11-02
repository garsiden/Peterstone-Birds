require 'gruff'
require 'sequel'

class PBGraph

    @@g = nil
    @@size = '720x540'

    def initialize
        @theme = create_theme
    end

    def init_graph
        @@g.theme= @theme
        @@g.title_font_size = 24
        @@g.legend_font_size =20
        @@g.marker_font_size = 20
        @@g.font ='/usr/X11R6/lib/X11/fonts/TTF/Vera.ttf' 
        @@g
    end

    private

    def create_theme
        # create Gruff theme
        @colors = [
            '#2f5a11', # green
            '#664114', # brown
            '#290D45', # blue
            '#8C8296', # light purple
            '#58545c', # darkest grey
            '#72786e', # grey/green
        ]
        theme = {
            :colors => @colors[1,1],
            :marker_color => 'black',
            :font_color => 'black',
            :background_colors => '#f2f1f4'
        }
    end
end

class MonthlyBarGraph < PBGraph

    def init_graph
        @@g = Gruff::Bar.new @@size
        @@g.hide_legend = true
        super
    end

    def set_data hash
        ds = DB[hash['view']].
            from_self. 
            filter(:bto_code => hash[bto_code]).
            select(:jul,:aug,:sep,:oct, :nov,
                   :dec,:jan,:feb,:mar,:apr)
        row = ds.first

        # get data as array and graph labels as hash using column names
        data =[] 
        labels = {}
        key = 0
        ds.columns.each do |c|
            data.push row[c] || 0
            labels[key]= c.to_s.capitalize
            key += 1
        end 

        g.title = hash['title']
        g.data(hash['title'], data);
        g.labels = labels
        g.minimum_value = 0
    end

    def get_graph
        @@g
    end
end

