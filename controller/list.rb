class ListController < Controller
#    map '/list'

    def initialize
	@isodd = false
    end

    def index(login = nil)
	login_first
	@user = login_or_user(login)
	@title = "Peterstone List"

	@species_list = {
	    :B => 'Blackbird',
	    :C => 'Crow',
	    :FF => 'Fieldfare',
	    :DR => 'Spotted Redshank',
	}
    end

    def cycle
	(@isodd = !@isodd) ? 'even' : 'odd'
    end

end
