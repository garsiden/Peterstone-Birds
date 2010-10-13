class Report

    def self.first_observations
        DB[:first_obs]
    end

    def self.last_updated
        DB[:list].max(:list_date)
    end

    def self.winter_wildfowl
        path =  __DIR__ + "/../data/sql/views/wildfowl_max.sql"
        sql = IO.read(path)
        ww = DB[sql]
        ww.from_self
    end
end
