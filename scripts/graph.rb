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

g = Gruff::Line.new
#('600x450')
#'780x585')

g.theme = {
   :colors => %w(orange purple green white red),
   :marker_color => 'black',
   :background_colors => %w(#e8ede5 white)
 }

g.title = 'Water Pipits'
g.font ='/usr/X11R6/lib/X11/fonts/TTF/Vera.ttf' 
#'/usr/local/share/fonts/AmericanTypewriter.ttf'
#'/usr/local/share/fonts/GenevaCY.ttf'
#'/usr/local/share/fonts/GillSans.ttf'
#/usr/local/share/fonts/GillSans.ttf

g.data('2007-08',[nil,nil,2,nil,2,nil,1,2,12,nil])
g.data('2008-09', [nil,nil,nil,1,2,5,19,12,11,4])
g.data('2009-10', [nil,nil,nil,4,5,9,20,4,7,34])
g.labels ={0=>'Jul',2=>'Sep', 4=>'Nov',6=>'Jan',8=>'Mar'}
g.marker_count = 6
g.write('/tmp/waterpipits.png')

rm = Image.from_blob(g.to_blob)
rm[0].scale!(0.8)
rm[0].write('/tmp/pipits.png')
