class Report

    def self.first_observations
        DB[:first_obs]
    end

    def self.last_updated
        DB[:lists].max(:list_date)
    end

    def self.wintering
        DB[:wintering].from_self
    end

    def self.hotspot
        DB[:hotspot]
    end

    private

    def self.get_sql query
        path =  "sql/#{query}"
        sql = IO.read(path)
    end
end
