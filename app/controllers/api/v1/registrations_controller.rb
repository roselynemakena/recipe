class Api::V1::RegistrationsController < Devise::RegistrationsController

      skip_before_filter :verify_authenticity_token, :only => :create
      include DeviseTokenAuth::Concerns::User


end