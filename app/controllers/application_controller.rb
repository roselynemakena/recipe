class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  protect_from_forgery unless: -> { request.format.json? }
  before_action :authenticate_user!, except: [:show]



    # Overwriting the sign_out redirect path method
private
  
end
