require 'gruff'
require 'sequel'
require 'pp'

class Gruff::Base

    DEFAULT_SIZE = '720x540'
    DEFAULT_THEME = 'psbirds'
    @spec = nil

    def theme_psbirds
        reset_themes
        @colors = [
            '#2f5a11', # green
            '#664114', # brown
            '#290D45', # blue
            '#8C8296', # light purple
            '#58545c', # darkest grey
            '#72786e', # grey/green
            'black',
        ]

        self.theme = {
            :colors => @colors,
            :marker_color => 'black',
            :font_color => 'black',
            :background_colors => '#f2f1f4'
        }
    end

    def theme_monochrome
        reset_themes
        @colors = "6E9C7ADB".scan(/./).collect { |c| "##{c * 6}"}
        @marker_color = 'black'
        @base_image = render_gradiated_background('white', 'white')
    end

    private
    def set_graph 
        @title = @spec['title']
        @title_font_size = 24.0
        @legend_font_size = 20.0
        @marker_font_size = 20.0
    end

    def set_data
        # needs to be set after instantiation - for scaling?
        self.font = @font
    end
end

class MonthlyLine< Gruff::Line

    def initialize spec
        @spec = spec
        super DEFAULT_SIZE
        meth = spec['theme'] || DEFAULT_THEME
        self.method('theme_' + meth).call
    end

    def initialize_ivars
        super
        set_graph
    end

    def set_data
        super
        ds = DB[@spec['view'].to_sym].
            from_self. 
            filter(:bto_code => @spec['bto_code']).
            select(@spec['legend_field'].to_sym,
                   :jul,:aug,:sep,:oct, :nov,
                   :dec,:jan,:feb,:mar,:apr)
        rows = ds.all

        labels = {}
        key = -1
        ds.columns[1..-1].each { |c| labels[key+=1]= c.to_s.capitalize }

        data_sets = []
        rows.each do |row|
            data =[] 
            ds.columns.each { |c| data.push row[c] }
            data_sets.push data
        end

        data_sets[-5..-2].each {|s| self.data(s[0], s[1 .. -1]) }
        @labels = labels
        @minimum_value = 0 # set after data
    end
end

class MonthlyBar < Gruff::Bar

    def initialize spec
        @spec = spec
        super DEFAULT_SIZE
        meth = spec['theme'] || DEFAULT_THEME
        self.method('theme_' + meth).call
        @colors = [ @spec['bar_colour'] ] || @colors
    end

    def initialize_ivars
        super 
        set_graph
        @hide_legend = true
    end

    def set_data 
        super # must call super here to set font correctly
        ds = DB[@spec['view'].to_sym].
            from_self. 
            filter(:bto_code => @spec['bto_code']).
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

        @labels = labels
        self.data(@spec['name'], data)
        #pp self
        @minimum_value = 0 # set after data
    end
end
