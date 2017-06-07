class ProductsController < ApplicationController
	before_action :require_signin, except: [:index, :show]
#	before_action :require_admin, except: [:index, :show]

	def index
		#@product = ['Procuct 1', 'Product 2']
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
		@orders = @product.orders#Himadri
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		#product_params = params.require(:product).
		#	permit(:name, :price, :description, :status)

		if @product.update(product_params)
			redirect_to @product
		else
			render :edit
		end
	end

	def new
		@product = Product.new
	end

	def create
		#product_params = params.require(:product).
		#	permit(:name, :price, :description, :status)
		
		@product = Product.new(product_params)

		if @product.save
			redirect_to @product
		else
			render :new
		end
	end
'''
	def find_cart
	unless session[:cart]
		session[:cart] = Array.new
	end
		session[:cart]
	end
'''
	def add_to_cart
'''
			product = Product.find(params[:id])
			if !session[:cart]
				session[:cart] = Array.new
			end	
			session[:cart] << [\'pid\' => product.id, \'qty\' => 1]
			redirect_to root_url, notice: "Product added to your cart! Want to buy more?"
'''

		@updated = false
		begin
			product = Product.find(params[:id])
			session[:cart].each do |itr|
				if itr['pid'] == product.id
					itr['qty'] += 1
					@updated = true
					break
				end
			end

			if @updated == false
				session[:cart] << {'pid' => product.id, 'qty' => 1}
			end
			redirect_to root_url, notice: "Product added to your cart! Want to buy more?"
		rescue ActiveRecord::RecordNotFound
			flash[:notice] = "Invalid product"
			redirect_to :action => :index
			redirect_to products_path, notice: "Invalid product...!"
		else
		end		

	end

	def empty_cart
		session[:cart].clear
		redirect_to products_path
	end

private

	def product_params
		params.require(:product).
			permit(:name, :price, :description, :status)
	end
end
