require 'lib/pbgraph'
require 'yaml'
require 'pp'

class ImageController < Ramaze::Controller
    engine :None

    def initialize
        @graphs = YAML::load_file('yaml/graphs.yaml')
        super
    end

    def get_graph
        id = request['id'].to_i
        graph = @graphs[id]
        class_name = graph['type'].gsub(' ', '')
        g = Kernel.const_get(class_name).new(graph)
        g.set_data
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

