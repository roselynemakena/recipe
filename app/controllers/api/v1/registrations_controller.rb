class Api::V1::RegistrationsController < Devise::RegistrationsController

      skip_before_action :verify_authenticity_token, :only => :create
      include Devise::Controllers::InternalHelpers
      include DeviseTokenAuth::Concerns::User


end