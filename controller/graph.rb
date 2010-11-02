class GraphController < Controller
    require 'yaml'

    layout 'nomenu_layout'
    
    def index
        @title += " - Graphs"
        @caption = 'Graphs'
        @graphs = YAML::load_file('yaml/graphs.yaml')
    end

    def show graph
        text = graph.gsub(/\/|_/, ' ').gsub(/\b./) { |m| m.upcase }
        @title += " - #{text} Graph"
        @graph = graph
    end

    private
    
    def breadcrumb path
        path =~ /(\w+$)/
        mapping = path.sub(/^\/graph\//, '')
        text = mapping.gsub(/\/|_/, ' ').gsub(/\b./) { |m| m.upcase }
        bread = []
        bread << anchor('Home', MainController.r('/'))
        bread << anchor('Graphs', '/')
        bread << anchor(text, mapping)
        bread.join(' >> ')
    end
end
