class GraphController < Controller
    require 'yaml'

    layout 'nomenu_layout'

    def initialize
        super
        @graphs = YAML::load_file('yaml/graphs.yaml')
    end

    def index
        @title += " - Graphs"
        @caption = 'Graphs'
    end

    def show 
        @id = request['id']
        @graph = @graphs[@id.to_i]
        @text =  @graph['text']
        @text.gsub!("\n", '<br/>') if @text
    end

    private

    def breadcrumb path
        path =~ /(\w+$)/
           mapping = path.sub(/^\/graph\//, '')
        bread = []
        bread << anchor('Home', MainController.r('/'))
        bread << anchor('Graphs', '/')
        bread << anchor(@graph['name'], mapping)
        bread.join(' >> ')
    end
end
