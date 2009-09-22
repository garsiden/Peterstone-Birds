class AccountController < Controller
#  helper :simple_captcha, :identity
#  layout 'minimal_layout'
    layout 'minimal_layout'

  # TODO: use stack
  def login
    redirect_referrer if logged_in?
    push request.referrer unless inside_stack?

    case request[:fail]
    when 'session'
      flash[:bad] =
        'Failed to login, please make sure you have cookies enabled for this site'
    end

    return unless request.post?

    if user_login
      flash[:good] = "Welcome back #{user.login}"
      redirect rs(:after_login)
    end
  end

  # This method is simply to check whether we really did login and the 
  # browser sends us a cookie, if we're not logged in by now it would
  # indicate that the client doesn't support cookies or has it disabled
  # and so unable to use this site.
  # For some reason, the arora seems to have problems handling cookies on
  # localhost from rack.
  def after_login
    if logged_in?
#      answer ProfileController.r(user.login)
	answer ListController.r
    else
      redirect rs(:login, :fail => :session)
    end
  end

  def logout
    user_logout
    flash[:good] = "You logged out successfully"
    redirect MainController.r(:index)
  end

 end
