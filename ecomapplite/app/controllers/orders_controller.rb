class OrdersController < ApplicationController

	before_action :initialize_customer
	def index
		#@customer = Customer.find(params[:customer_id])
#		@orders = Order.all
		@orders = @customer.orders
	end

	def new
		#@customer = Customer.find(params[:customer_id])
		@order = @customer.orders.new
	end

	def create

		#@customer = Customer.find(params[:customer_id])
		@order = @customer.orders.new(order_params)
		
		if @order.save
			redirect_to customer_orders_path(@customer),
				notice: "Thanks, your order is registered!"

		else
			render :new
		end
	end

private
	def order_params
		params.require(:order).permit(:order_no, :date, :total)
	end

	def initialize_customer
		@customer = Customer.find(params[:customer_id])
	end
end
