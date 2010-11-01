require 'RMagick'
include Magick

class ImageController < Ramaze::Controller
    engine :None

    def get_graph graph
       iml = ImageList.new('public/pipits.png')
       #iml[0].scale!(0.9)
       blob = iml[0].to_blob 
       response.reset
       response.header['Content-Type']='image/png'
       response.header['Content-Length']= blob.length
       response.header['Content-Disposition']= 'inline; filename="pipits.png"'

       blob
    end
end

