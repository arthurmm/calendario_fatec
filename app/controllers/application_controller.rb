class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  layout :logged_layout

  def logged_layout
    user_signed_in? ? "application" : "login"
  end

end

