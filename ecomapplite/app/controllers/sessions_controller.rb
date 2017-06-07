class SessionsController < ApplicationController
	def new

	end

	def create
		#customer = User.find_by(email: params[:email])
		if customer = Customer.authenticate(params[:email], params[:password])
			session[:customer_id] = customer.id
			flash[:notice] = "Welcome:  #{customer.firstname}  #{customer.lastname}!"
		
			redirect_to (session[:intended_url] || customer)
			#redirect_to (customer)
			session[:intended_url] = nil
			session[:cart] = Array.new
		else
			flash.now[:alert] = "Invalid email/password entered!"
			render :new	
		end
	end

	def destroy
		session[:customer_id] = nil

		#session[:intended_url] = nil
		#session[:cart] = nil
       	if session[:cart]
	 		session[:cart].clear
       	end
	 
		redirect_to root_url, notice: "You are signed out!"
	end

end
