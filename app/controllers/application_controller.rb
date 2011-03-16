class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :autenticate_user!
end

