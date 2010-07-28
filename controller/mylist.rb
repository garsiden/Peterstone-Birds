class MyListController < ListController
    helper :aspect

    def index(login)
        @user = login_or_user(login)    # base class method
        @title = "Peterstone List"
        @headings = ['Code', 'Species Name', 'First Date', '' ]
        @sightings = @user.my_list
    end
    
    def edit
        bto_code = request[:bto_code]
        @user = user
        @title = "Edit Entry"
        @legend = "Edit Entry"
        @submit = "Update Entry"
        @ob = Observation[user.user_id, bto_code]
        save                            # private method
    end
    
    def new 
        @user = user                    # Helper::User instance method

        if not request.post?
            @legend = "New Entry"
            @title = @legend
            @submit = "Create Entry"
            @birds = user.unseen_list
        end

        @ob = Observation.new(:user_id => user.user_id)
        save
    end

    def delete 
        if bto_code = request[:bto_code]
            Observation[user.user_id, bto_code].delete
        end
        redirect self.route_self(:/, user.login)
    end

    # aspect helper method
    before(:index, :edit, :new, :delete) {login_first}

    private

    def save
        return unless request.post?

        @ob.first_date = request[:first_date]
        @ob.note = h(request[:note])
        @ob.bto_code = request[:bto_code]

        if @ob.save_changes 
            flash[:good] = "Created observation"
            redirect self.route_self(:/, @user.login)
        else
            flash[:bad] = "Couldn't create observation"
        end
    end

end

