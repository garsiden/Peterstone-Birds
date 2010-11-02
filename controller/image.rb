require 'lib/pbgraph'
#require 'gruff'
require 'yaml'

class ImageController < Ramaze::Controller
    engine :None

    def initialize
        @graphs = YAML::load_file('yaml/test.yaml')
        super
    end

    def get_graph graph
        pbg = MonthlyBarGraph.new
        pbg.init_graph
        pbg.set_date @graphs[graph]
        g = pbg.get_graph
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

