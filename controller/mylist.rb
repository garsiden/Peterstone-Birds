class MyListController < ListController
    require 'date'

    helper :aspect

    def initialize
        if @bto_code = request[:bto_code]
            session[:bto_code] = @bto_code
        else
            @bto_code = session[:bto_code]
        end

        super
    end

    def index(login)
        @user = login_or_user(login)    # base class method
        @title = "Peterstone List"
        @headings = ['Code', 'Species Name', 'First Date', '' ]
        @sightings = @user.my_list
    end
    
    def edit
        @title = "Edit Entry"
        @legend = "Edit Entry"
        @submit = "Update Entry"
        @ob = Observation[user.user_id, @bto_code]
        save                            # private method
    end
    
    def new 
        if not request.post?
            @legend = "New Entry"
            @title = @legend
            @submit = "Create Entry"
            @birds = user.unseen_list
        end

        @ob = Observation.new(:user_id => user.user_id,
                             :bto_code => @bto_code)
        save
    end

    def delete 
        if @bto_code
            Observation[user.user_id, @bto_code].delete
        end
        redirect self.route_self(:/, user.login)
    end

    # aspect helper method
    before(:index, :edit, :new, :delete) {login_first}

    private

    def save
        return unless request.post?

        fd = Date.strptime(request[:first_date], "%d/%m/%Y")
        @ob.first_date = fd
        @ob.note = h(request[:note])

        if @ob.save_changes 
            flash[:good] = "Created observation"
            redirect self.route_self(:/, user.login)
        else
            flash[:bad] = "Couldn't create observation"
        end
    end
end

