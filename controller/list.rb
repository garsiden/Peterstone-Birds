class ListController < Controller
    helper :aspect

    def initialize
	@isodd = false
    end

    def index(login = nil)
	@user = login_or_user(login)	# base class method
	@title = "Peterstone List"
	@sightings = Species.eager_graph(:sightings).all
    end

    def edit(id)
	@user = user
	@legend = "Edit Entry"
	@submit = "Update Entry"
	save				# private method
    end

    def new
	@user = user			# Helper::User instance method
	@legend = "New Entry"
	@submit = "Create Entry"
	save
    end

    #template :new, :edit		# Ramaze::Controller method

    def cycle
	(@isodd = !@isodd) ? 'even' : 'odd'
    end

    # aspect helper method
    before(:index, :edit, :new) {login_first}

    private

    def save
	return unless request.post?

	@post.title = request[:title]
	@post.body = request[:body]

	if @post.save
	    flash[:good] = "Created post"
	    redirect self.rs(:/, @post.to_url)
	else
	    flash[:bad] = "Couldn't create post"
	end
    end

end
