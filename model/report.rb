class Report

    def self.first_observations
        sql = self.get_sql 'first_obs.sql'
        DB[sql]
    end

    def self.last_updated
        DB[:lists].max(:list_date)
    end

    def self.winter_wildfowl
        sql = self.get_sql 'wintering.sql'
        ww = DB[sql]
        ww.from_self
    end

    private

    def self.get_sql query
        path =  __DIR__ + "/../sql/" + query
        sql = IO.read(path)
    end
end
