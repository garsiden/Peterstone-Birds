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

        # display 10 columns (last 7 years)
        # gate array of table headings
        ncols = @first_obs[0].keys.count
        first = ncols - 8
        last  = ncols - 2 
        @headings = ['Species']
        first.upto(last) { |y| @headings << "20%02i" % y }
        @headings.concat %w[ Earliest Latest ]

        # get array of keys for last 7 years
        keys = @first_obs[0].keys.map { |k| k.to_s }
        @years = keys.grep(/^year\d\d$/).sort.last(7).map { |y| y.to_sym }
    end
end
