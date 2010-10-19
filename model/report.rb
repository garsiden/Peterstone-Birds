class Report

    def self.first_observations
        sql = self.get_sql 'first_obs.sql'
        DB[sql]
    end

    def self.last_updated
        DB[:lists].max(:list_date)
    end

    def self.wintering
        sql = self.get_sql 'wintering.sql'
        DB[sql].from_self
    end

    def self.hotspot
        sql = self.get_sql 'hotspot.sql'
        DB[sql];
    end

    private

    def self.get_sql query
        path =  "sql/#{query}"
        sql = IO.read(path)
    end
end
