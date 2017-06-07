module ApplicationHelper
'''
	def current_user
		Customer.find(session[:customer_id]) if session[:customer_id]
	end
'''
end
