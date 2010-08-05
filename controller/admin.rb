class AdminController < Controller

    helper :aspect

    before_all {login_first; redirect_referrer unless user.is_admin}

    def users
        @title = "Users"
        @headings = %w( ID Login Name Created Updated ) << ' '
        @users = Sequel::Model::User.order(:created_at)
    end

    def edit_user 
        user_id = request[:user_id]
        @edit_user = Sequel::Model::User[user_id]

        if not request.post?
            @title = ' Edit User'
            @submit = "Update"
            @legend = "Edit User"  
        else
            @edit_user.login = request[:login]
            @edit_user.name = request[:name]
            @edit_user.is_admin = request[:is_admin]
            if @edit_user.save_changes
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
            new_user = Sequel::Model::User.prepare(request)
            if new_user.save
                redirect self.route_self(:users)
            end
        end
    end
end
