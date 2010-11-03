require 'gruff'
require 'sequel'


class Gruff::Base

    DEFAULT_SIZE = '720x540'

    def my_theme
        @colors = [
            '#2f5a11', # green
            '#664114', # brown
            '#290D45', # blue
            '#8C8296', # light purple
            '#58545c', # darkest grey
            '#72786e', # grey/green
        ]

        self.theme = {
            :colors => @colors,
            :marker_color => 'black',
            :font_color => 'black',
            :background_colors => '#f2f1f4'
        }
    end

    def init_graph
        self.my_theme
        self.title_font_size = 24
        self.legend_font_size =20
        self.marker_font_size = 20
        self.font= '/usr/X11R6/lib/X11/fonts/TTF/Vera.ttf' 
    end
end

class MonthlyLineGraph < Gruff::Line

    def initialize
        super DEFAULT_SIZE
    end

    def set_data hash
        ds = DB[:wintering].
            from_self. 
            filter(:bto_code => hash['bto_code']).
            select(:jul,:aug,:sep,:oct, :nov,
                   :dec,:jan,:feb,:mar,:apr)
        row = ds.first
        data =[] 
        labels = {}
        key = 0
        ds.columns.each do |c|
            data.push row[c] #|| 0
            labels[key]= c.to_s.capitalize
            key += 1
        end 

        self.title = hash['title']
        self.data(hash['title'], data)
        self.labels = labels
        self.minimum_value = 0 # set after data
    end
end

class MonthlyBarGraph < Gruff::Bar

    def initialize
        super DEFAULT_SIZE
    end

    def init_graph
        self.hide_legend = true
        super
    end

    def set_data hash
        ds = DB[hash['view'].to_sym].
            from_self. 
            filter(:bto_code => hash['bto_code']).
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

        self.title = hash['title']
        self.data(hash['name'], data)
        self.labels = labels
        self.minimum_value = 0
    end
end
