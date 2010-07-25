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
            #@sightings = @user.observations.sort! {|a,b| b.first_date <=> a.first_date}
            @sightings = @user.observations_dataset.eager(:bird).order(:first_date.desc)
        else
            @sightings = Observation.eager(:bird).order(:first_date.desc)
        end
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
            @birds = Bird.filter(:bto_code=> Observation.filter(:user_id=>user.user_id).
                                 select(:bto_code)).invert.order(:name)
        end
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

        @ob = Observation.new(:user_id => user.user_id)
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
