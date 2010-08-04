class AdminController < Controller

    helper :aspect

    before(:users, :user_edit, :user_new) {login_first}

    def initialize
        @isodd = false
    end

    def cycle
        (@isodd = !@isodd) ? 'even' : 'odd'
    end

    def users
        @title = "Users"
        @headings = %w( ID Login Name Created Updated ) << ' '
        @users = Sequel::Model::User.order(:created_at)
    end

    def edit_user 
        user_id = request[:user_id]
        @user = Sequel::Model::User[user_id]

        if not request.post?
            @title = ' Edit User'
            @submit = "Update"
            @legend = "Edit User #{@user.name}"
        else
            @user.login = request[:login]
            @user.name = request[:name]
            if @user.save_changes
                redirect self.route_self(:users)
            end
        end
    end

    def new_user

        if not request.post?
            @title = "Add User"
            @submit = "Submit"
            @legend = @title
        else
            user = Sequel::Model::User.prepare(request)
            if user.save
                redirect self.route_self(:users)
            end
        end
    end
end
