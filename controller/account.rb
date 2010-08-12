class AccountController < Controller 
    layout 'minimal_layout'

    def initialize
        @title = "Peterstone Birds"
    end

    def login
        redirect_referrer if logged_in?
        return unless request.post?

        # default Helper::User method argument is 'creds = request.params'
        if user_login   
            flash[:good] = "Welcome back #{user.login}"
        else
            msg = "Unable to login. Try again or return #{a('home', MainController.r)}"
            flash[:fail] = msg
        end
        redirect rs(:after_login)
    end

    def after_login
        if logged_in?
            answer MyListController.r(user.login)     # default to home if nothing on stack
        else
            redirect MainController.r #, :fail => :session)
        end
    end

    def logout
        user_logout
        #flash[:good] = "You logged out successfully"
        redirect MainController.r(:index)
    end

    def create
        redirect_referrer if logged_in?
        @user = Sequel::Model::User.prepare(request.params)
        # they will be used in the form
        # @login, @email = @user.login, @user.email

        if request.post?
            if @user.save
                flash[:good] = "You signed up, welcome on board #{@user.login}!"
                user_login('login' => @user.login)
                answer MainController.r     # default to home if nothing on stack
            end
        end
    end

end
