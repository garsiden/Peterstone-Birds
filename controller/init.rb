# Define a subclass of Ramaze::Controller holding your defaults for all
# controllers
require 'controller/helpers'
include Innate::Traited

class Controller < Ramaze::Controller
    include AppHelpers
    layout :default
    engine :Haml
    helper :xhtml, :user, :stack
    #  helper :xhtml, :config, :user, :formatting, :form, :gravatar, :stack

    private

    def login_first
	return if logged_in?
	call AccountController.r(:login)
    end

    def login_or_user(login)
	@user = nil

	if login
	    @user = Sequel::Model::User[:login => login]
	elsif logged_in?
	    @user = user
	else
	    nil
	end
    #ensure
#	@profile = @user.profile if @user
    end
end

# Here go your requires for subclasses of Controller:
require __DIR__('main')
require __DIR__('shared')
require __DIR__('account')
require __DIR__('list')
