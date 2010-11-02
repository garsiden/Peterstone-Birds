require 'gruff'
require 'digest/sha1'
#require 'RMagick'
#include Magick

class ImageController < Ramaze::Controller
    engine :None

    def get_graph graph
        # get data from database
        ds = Report::wintering_max.
            filter(:bto_code => 'SV').
            select(:species,:jul,:aug,:sep,:oct,
                   :nov,:dec,:jan,:feb,:mar,:apr)
        row = ds.first

        # get data as array and graph labels as hash using column names
        cols = ds.columns.reject {|c| c == :bto_code || c == :species}
        data =[]
        labels = {}
        key = 0
        cols.each do |c|
            data.push row[c]
            labels[key]= c.to_s.capitalize
            key += 1
        end 

        # create Gruff theme
        colors = [
            '#2f5a11', # green
            '#664114', # brown
            '#290D45', # blue
            '#8C8296', # light purple
            '#58545c', # darkest grey
            '#72786e', # grey/green
        ]
        theme = {
            :colors => colors[2,2],
            :marker_color => 'black',
            :font_color => 'black',
            :background_colors => '#f2f1f4'
        }

        # create graph
        g = Gruff::Bar.new '720x540'
        g.theme= theme
        g.title = "Maximum Monthly #{row[:species]} Count"
        g.data(g.title, data)
        g.labels = labels
        g.hide_legend = true
        g.title_font_size = 24
        g.minimum_value = 0
        g.legend_font_size =20
        g.marker_font_size = 20
        g.font ='/usr/X11R6/lib/X11/fonts/TTF/Vera.ttf' 
        blob = g.to_blob
        hb= Digest::SHA1.hexdigest blob
        p hb

        # create response header
        response.reset
        response.header['Content-Type']='image/png'
        response.header['Content-Length']= blob.length
        response.header['Content-Disposition']= 'inline; filename="pipits.png"'
        response.header['Etag']= hb

        # return graph as blob
        blob
    end
end

