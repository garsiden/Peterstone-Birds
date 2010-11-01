class GraphController < Controller
    require 'yaml'

    layout 'nomenu_layout'
    
    def index
        @title += "- Graphs"
        @caption = 'Graphs'
        @graphs = YAML::load_file('yaml/graphs.yaml')
    end

    def show graph

        @title += "#{graph} Graph"
        @graph = graph
        p graph

    end
end
