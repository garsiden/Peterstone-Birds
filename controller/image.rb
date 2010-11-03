require 'lib/pbgraph'
#require 'gruff'
require 'yaml'

class ImageController < Ramaze::Controller
    engine :None

    def initialize
        @graphs = YAML::load_file('yaml/graphs.yaml')
        super
    end

    def get_graph graph
        g = MonthlyBarGraph.new
        g.init_graph
        g.set_data @graphs[graph]
        blob = g.to_blob

        # create response header
        response.reset
        response.header['Content-Type']='image/png'
        response.header['Content-Length']= blob.length
        response.header['Content-Disposition']= 'inline; filename="pipits.png"'
        
        # return graph as blob
        blob
    end

end

