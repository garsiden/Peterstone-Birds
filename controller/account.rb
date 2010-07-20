class AccountController < Controller 
    layout 'minimal_layout'

    def initialize
        @title = "Peterstone Birds"
    end

    def login
        redirect_referrer if logged_in?
        push request.referrer unless inside_stack?
        return unless request.post?

        # default Helper::User method argument is 'creds = request.params'
        if user_login   
            flash[:good] = "Welcome back #{user.login}"
            redirect rs(:after_login)
        end
    end

    def after_login
        if logged_in?
            answer MainController.r     # default to home if nothing on stack
        else
            redirect rs(:login, :fail => :session)
        end
    end

    def logout
        user_logout
        flash[:good] = "You logged out successfully"
        redirect MainController.r(:index)
    end

end
