class ReportController < Controller

    layout 'report_layout'

    def initialize
        @last_updated = Report.last_updated
        super
    end

    def first_observations
        @title += " - First Observations"
        @first_obs = Report.first_observations
        @headings = %w( Species 2004 2005 2006 2007 2008 2009 2010 Earliest Latest )
    end
end
