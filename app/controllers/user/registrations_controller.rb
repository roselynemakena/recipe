class User::RegistrationsController < Devise::RegistrationsController

before_filter :configure_permitted_params

protected

def configure_permitted_params

	devise_parameter_sanitizer.permit(:signup, keys: [:first_name, :last_name])
	devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
	
end

end