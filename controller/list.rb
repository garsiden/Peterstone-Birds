class ListController < Controller
    helper :aspect

    def initialize
        @isodd = false
    end

    def index(login = nil)
        @user = login_or_user(login)    # base class method
        @title = "Peterstone List"
        @headings = ['Code', 'Species Name', 'First Date', '' ]
        if login
            @sightings = @user.observations
        else
            @sightings = Observation.order(:bto_code)
        end
    end

    def edit
        bto_code = request[:bto_code]
        @user = user
        @title = "Edit Entry"
        @legend = "Edit Entry"
        @submit = "Update Entry"
        @ob = Observation.first(:bto_code=>bto_code, :user_id=>user.user_id)
        save                            # private method
    end

    def new
        @user = user                    # Helper::User instance method
        @legend = "New Entry"
        @submit = "Create Entry"
        save
    end

    #template :new, :edit               # Ramaze::Controller method

    def cycle
        (@isodd = !@isodd) ? 'even' : 'odd'
    end

    # aspect helper method
    before(:index, :edit, :new) {login_first}

    private

    def save
        return unless request.post?

        @ob.first_date = request[:first_date]
        @ob.note = h(request[:note])

        if @ob.save_changes 
            flash[:good] = "Created observation"
            redirect self.route_self(:/, @user.login)
        else
            flash[:bad] = "Couldn't create observation"
        end
    end

end
