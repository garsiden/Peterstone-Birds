class ListController < Controller

    def initialize
	@isodd = false
    end

    def index(login = nil)
	login_first
	@user = login_or_user(login)
	@title = "Peterstone List"

	@sightings = Species.eager_graph(:sightings).all

#	if title
#	    id = title[/^(\d+)-/, 1]
#	    @blog = Blog[id]
#	end

    end

    def edit(id)
	login_first

#	@user, @profile = user, user.profile
	@user = user
#	redirect_referrer unless @post = Blog[id]
	@legend = "Edit Entry"
	@submit = "Update Entry"

	save
    end

    def new
	login_first

#	@user, @profile = user, user.profile
	@user = user
#	@post = Blog.new(:profile => @profile)
	@legend = "New Entry"
	@submit = "Create Entry"

	save
    end

    #template :new, :edit

    def cycle
	(@isodd = !@isodd) ? 'even' : 'odd'
    end

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
