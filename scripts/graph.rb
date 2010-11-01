#! /usr/bin/env ruby

require 'rubygems'
require 'gruff'
require 'sequel'
require 'RMagick'
include Magick

# Colors
green = '#339933'
purple = '#cc99cc'
blue = '#336699'
yellow = '#FFF804'
red = '#ff0000'
orange = '#cf5910'
black = 'black'
colors = [yellow, blue, green, red, purple, orange, black]

#'/usr/local/share/fonts/AmericanTypewriter.ttf'
#'/usr/local/share/fonts/GenevaCY.ttf'
#/usr/local/share/fonts/GillSans.ttf

#rm = Image.from_blob(g.to_blob)
#rm[0].scale!(0.8)
#rm[0].write('/tmp/pipits.png')

class Gruff::Base
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
end

# try themes
themes = %w[
    theme_37signals
    theme_greyscale
    theme_keynote
    theme_odeo
    theme_pastel
    theme_rails_keynote
    my_theme
]

themes[-1].each do |t|
    g = Gruff::Line.new '720x540'
    g.method(t).call
#    g.data('2005-06', [nil,nil,4,10,29,29,25,8])
#    g.data('2006-07', [nil,nil,nil,7,6,12,6,nil])
    g.data('2007-08',[2,nil,2,nil,1,2,12,nil])
    g.data('2008-09', [nil,1,2,5,19,12,11,4])
    g.data('2009-10', [nil,4,5,9,20,4,7,34])
    g.labels ={
        0=>'Sep',
        1=>'Oct',
        2=>'Nov',
        3=>'Dec',
        4=>'Jan',
        5=>'Feb',
        6=>'Mar',
        7=>'Apr',
    }
    g.marker_count = 6
    g.title = 'Water Pipits'
    g.title_font_size = 24
    #g.minimum_value = 0
    g.legend_font_size =20
    g.marker_font_size = 20
    #g.y_axis_increment = 5
    g.hide_dots = false
    g.dot_radius = 4
    g.line_width = 4
    g.font ='/usr/X11R6/lib/X11/fonts/TTF/Vera.ttf' 
    path = File.expand_path "~/graphs/#{t}.png"
    g.write(path)
    puts "Created #{t} graph"
end
