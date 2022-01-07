class ApplicationController < ActionController::Base
	protect_from_forgery
	def after_sign_in_path_for(resource) 
      current_user.admin == true ? clients_url : home_error_path
  end
end
