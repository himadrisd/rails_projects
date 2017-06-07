require 'pos_terminal'

class CustomersController < ApplicationController
	before_action :require_signin, except: [:new, :create ]
	before_action :require_correct_user, only: [:edit, :update]
	before_action :require_admin, only: [:index]
	skip_before_action :verify_authenticity_token, only: [:save_order]

	def index
		@customers = Customer.all
	end

	def show
		@customer = Customer.find(params[:id])
	end

	def new
		@customer = Customer.new

	end

	def edit
		#@customer = Customer.find(params[:id])
	end

	def update
		#@customer = Customer.find(params[:id])

		if @customer.update(user_params)
			redirect_to @customer, notice: "User a/c update successful!"
		else
			render :edit
		end		
	end

	def create
		#user_params = params.require(:customer).
		#	permit(:firstname, :lastname, :email, :password, :password_confirmation)
		
		@customer = Customer.new(user_params)
		#@customer = User.new(params[:customer])

		if @customer.save
			session[:customer_id] = @customer.id
			redirect_to @customer, notice: "Thanks for signing up!"
		else
			render :new
		end
	end

'''
	def destroy
		#@customer = User.find(params[:id])
		@customer.destroy
		session[:customer_id] = nil
		redirect_to root_url, alert: "User a/c deleted!"
	end
'''
	def empty_cart
		session[:cart].clear
		#redirect_to products_path
		redirect_to root_url
	end

	def checkout
		
		#process checkout
		@customer = Customer.find(session[:customer_id])
		@order = @customer.orders
		#redirect_to "credit_card", notice: "Payment....	"
	
	end

	def save_order

		redirect_to "/process_payment", notice: "Your order is saved!"

		#if @order.save
	#		session[:cart] = nil
			#redirect_to root_url, notice: "Your order is saved!"
	#	else
	#		render :action => :checkout
	#	end

	end

	def process_payment
		#if credit_card.valid?
		# Create a gateway object to the TrustCommerce service
			begin
			  response = PosTerminal.authorize_default(1000)

			  if (response.code == "201") || (response.code == "200")
			    # Settelment the money
			    #gateway.selletment(1000, response.authorization)
			    ###############################################
			    #save order into database
			    ###############################################
			      @customer = Customer.find(session[:customer_id])
			      last_order_no = Order.last.order_no[1..7].to_i
			      last_order_no += 1
			      last_order_no = last_order_no.to_s
			      new_order_no = "O"
			      	for i in last_order_no.to_s.size..6
			      		new_order_no += "0"
			      	end
			      	new_order_no += last_order_no



				  @order = Order.new(order_no: new_order_no, 
				  					customer_id: session[:customer_id],
				  					total: 210.33, # total_amount(session[:cart]),
				  					date:  Time.now.strftime("%d/%m/%Y"))
				  @order.save


				
				    redirect_to "/process_payment_success", notice: "Payment Successful!"
			  else
			    #raise StandardError, response.message
			    redirect_to "/process_payment_failed", notice: "Sorry payment error, retry!"
			  end
			rescue => e
				@error = e.message

				redirect_to "/process_payment_failed", notice: PosTerminal.get_poserror
			end
		#end
	end

	def process_payment_failed

	end

	def process_payment_success
		session[:cart].clear
	end

	def get_save_order

		redirect_to "payment_process", notice: "Your order is saved! Processing payment..."

	end

private

	def total_amount
		#####to be implemented and set actual 
		#price in order tables and order_lines tables
		'''
		@product = 
		@amount = 0
		if session[:cart]			
			session[:cart].each do |do|
				@amount += @customer.orders
			end
		end
		'''
	end

	def user_params
		params.require(:customer).
				permit(:firstname, :lastname, :email, :password, :password_confirmation)

	end

	def require_correct_user
		@customer = Customer.find(params[:id])
		unless current_user?(@customer)
		 	redirect_to root_url
		end 

	end

end
