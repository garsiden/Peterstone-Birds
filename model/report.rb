class Report

    def self.first_observations
        DB[:first_obs]
    end

    def self.last_updated
        DB[:list].max(:list_date)
    end

end
