class OrderLinesController < ApplicationController
	def index
		@order = Order.find(params[:order_id])
		#@product = Product.find(params[:product_id])
		#@order_lines = OrderLine.all
		@order_lines = @order.order_lines
		@product = @order_lines.product_id
	end

	def show
		@order_lines = OrderLine.find(params[:id])
	end

end
