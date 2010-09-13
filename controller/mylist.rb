class MyListController < Controller
    require 'date'

    helper :aspect

    def initialize
        @bto_code = request[:bto_code]
        super
    end

    def index(login)
        @user = login_or_user(login)    # base class method
        @title += " - List for #{user.name}" 
        @headings = ['Code', 'Species Name', 'First Date', '' ]
        @sightings = @user.my_list
    end

    def edit
        @ob = Observation[user.user_id, @bto_code]
        @title += " - Edit Entry for #{@ob.bird.name}"
        @legend = "Edit Entry"
        @submit = "Update Entry"
        save                            # private method
    end

    def new 
        if not request.post?
            @title += " - New Entry"
            @legend = "New Entry"
            @submit = "Create Entry"
            @birds = user.unseen_list.all
            @birds.insert(0, Bird.new({:bto_code=>"XX", :name=>"-- Select Species -- "}))
        else
            @ob = Observation.new(:user_id => user.user_id,
                                  :bto_code => @bto_code)
        end

        save
    end

    def delete 
        Observation[user.user_id, @bto_code].delete if @bto_code
        redirect self.route_self(:/, user.login)
    end

    # aspect helper method
    before(:index, :edit, :new, :delete) {login_first}

    private

    def save
        return unless request.post?

        first_date = Date.strptime(request[:first_date], "%d-%m-%Y")
        @ob.first_date = first_date
        @ob.note = h(request[:note])

        if @ob.save_changes 
            flash[:good] = "Created observation"
            redirect self.route_self(:/, user.login)
        else
            flash[:bad] = "Couldn't create observation"
        end
    end
end

