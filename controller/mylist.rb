class MyListController < Controller
    require 'date'

    helper :aspect

    def initialize
        @bto_code = request[:bto_code] || 'XX'
        super
    end

    def index(login)
        @user = login_or_user(login)    # base class method
        @title += " - List for #{user.name}" 
        @headings = ['Code', 'Species Name', 'First Date', '' ]
        @sightings = @user.my_list
    end

    def edit
        if not request.post?
            session.delete(:ob) if (@ob = session[:ob])
        end            

        @ob ||= Observation[user.user_id, @bto_code]
        @title += " - Edit Entry for #{@ob.bird.name}"
        @legend = "Edit Entry"
        @submit = "Update Entry"
        save                            # private method
    end

    def new 
        if not request.post?
            # set up page
            @title += " - New Entry"
            @legend = "New Entry"
            @submit = "Create Entry"
            @birds = user.unseen_list.all
            @birds.insert(0, Bird.new({:bto_code=>"XX",
                                      :name=>"-- Select Species -- "}))
            # redirected after error?
            session.delete(:ob) if (@ob = session[:ob])
        end

        # ob required in all circumstances
        @ob ||= Observation.new(:user_id => user.user_id,
                                :bto_code => @bto_code)
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
        @ob.note = h(request[:note])
        first_date = validate_date(request[:first_date])

        unless first_date
            @ob.first_date = request[:first_date]
            flash[:error] = 'Unable to add sighting'
            session[:ob] = @ob
            puts request.to_s
            puts request.request_uri()
            redirect request.request_uri()
        else
            @ob.first_date = first_date
        end

        unless @ob.save_changes == false
            redirect self.route_self(:/, user.login)
        else
            flash[:bad] = "Couldn't create observation"
            redirect_referrer
        end
    end

    def validate_date (date_string)
        begin
            return Date.strptime(date_string, "%d-%m-%Y")
        rescue => ex
            flash[:date_parse_error] = "Error: #{ex.message}"
            return nil
        end
    end
end

