class Api::V1::RegistrastionsController < Devise::RegistrationsController

      skip_before_filter :verify_authenticity_token, :only => :create
      include DeviseTokenAuth::Concerns::User


end