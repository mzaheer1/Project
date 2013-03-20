class ApplicationController < ActionController::Base
  protect_from_forgery

 User.current_user = @current_user
end
