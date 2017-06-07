class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  private

  	def require_signin
  		unless current_user
  			session[:intended_url] = request.url
  			redirect_to new_session_url, alert: "Please signin!"
  		end
  	end

	def current_user
		Customer.find(session[:customer_id]) if session[:customer_id]
	end

	helper_method :current_user

	def current_user?(customer)
		current_user == customer
	end

	helper_method :current_user?

	def require_admin
		unless current_user && current_user_admin?
			redirect_to root_url, alert: "You are not an Admin!"
		end
	end

	def current_user_admin?
		current_user && current_user.admin?
	end

	helper_method :current_user_admin?
end
