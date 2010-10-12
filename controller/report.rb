class ReportController < Controller

    layout 'report_layout'

    def initialize
        @last_updated = Report.last_updated
        super
    end

    def first_observations
        @title += " - First Observations"
        ds  = Report.first_observations
        @first_obs = ds.all

        # get array of keys for last 7 years
        keys = @first_obs[0].keys.map { |k| k.to_s }
        @headings =  keys.grep(/^\d{4}$/).sort.last(7)
        @years = @headings.map { |y| y.to_sym }
        @headings.unshift('Species')
        @headings.concat %w[ Earliest Latest ]
    end
end
