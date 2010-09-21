class AdminController < Controller

    helper :aspect

    before_all {login_first; redirect_referrer unless user.is_admin}

    def users
        @title += " - Users"
        @headings = %w( ID Login Name Created ) << ' '
        @users = Sequel::Model::User.order(:created_at)
    end

    def edit_user 
        user_id = request[:user_id]
        @edit_user = Sequel::Model::User[user_id]

        if not request.post?
            @title += " - Edit User #{user.name}"
            @submit = "Update"
            @legend = "Edit User"  
        else
            login, name, is_admin = request.values_at(*%w[login name is_admin])
            if @edit_user.update({:login=>login, :name=>name, :is_admin=>is_admin})
                redirect self.route_self(:users)
            end
        end
    end

    def new_user
        if not request.post?
            @title += " - Add User"
            @submit = "Submit"
            @legend = 'Add User' 
        else
            new_user = Sequel::Model::User.prepare(request)
            if new_user.save
                redirect self.route_self(:users)
            end
        end
    end
    
    def delete_user
        del_user_id = request[:user_id]
        if del_user_id
            Sequel::Model::User[del_user_id].delete
        end
        redirect self.route_self(:users)
    end

    def change_password
        user_id = request[:user_id]
        @pwd_user = Sequel::Model::User[user_id]

        if not request.post?
            @title += ' - Change Password'
            @submit = 'Submit'
            @legend = 'Change Password'
        else
            new_password = request[:new_password]
            if (@pwd_user.change_password(new_password))
                redirect self.route_self(:users)
            else
                flash[:user_pwd_error] = "Unable to change user's password"
                redirect request.request_uri
            end
        end
    end
end
