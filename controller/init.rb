# Define a subclass of Ramaze::Controller holding your defaults for all
# controllers
require 'controller/helpers'

class Controller < Ramaze::Controller
    include AppHelpers
    # Ramaze::Controller inherited methods
    layout :default
    engine :Haml
    # stack used for call method
    # xhtml for css/js methods
    helper :xhtml, :user, :stack        

    def initialize
        @header_text =  @title = "Peterstone Birds"
        super
    end

    private

    def login_first
        return if logged_in?
        # stack method adds this request to stack and redirects to argument
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

    end
end

# Here go your requires for subclasses of Controller:
require __DIR__('main')
require __DIR__('shared')
require __DIR__('account')
require __DIR__('list')
require __DIR__('mylist')
require __DIR__('admin')
require __DIR__('report')
require __DIR__('rss')
