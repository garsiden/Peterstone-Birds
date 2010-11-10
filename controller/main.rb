require 'yaml'

class MainController < Controller

    def index
        @bird_latest = Observation.latest
        @bird_count = Observation.total
    end

    def technical_note
        @title += "- Technical Note"
    end
        
    def about
        @title = "About " + @title
    end

    def whats_new
        @title += " - What's New"
        @header = "What's New"
        @items = YAML::load_file(ENV['YAML_PATH'] + '/whats_new.yaml')
        @items.sort! {|a,b| b['term'] <=> a['term'] }
    end
end
