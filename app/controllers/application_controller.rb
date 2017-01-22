class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  protect_from_forgery unless: -> { request.format.json? }
  before_action :authenticate_user!, except: [:show]



    # Overwriting the sign_out redirect path method
private
  def after_sign_up_path_for(resource_or_scope)
    home_path
  end

  def after_inactive_sign_up_path_for(resource)
    	new_user_session_path
	end
  
end
