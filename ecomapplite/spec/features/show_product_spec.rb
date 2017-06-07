require 'rails_helper'

describe "Viewing an individual product" do
	it " -> shows the product's deails" do
'''
		product = Product.create(	name: "New Product",
									id: 1,
									price: 150.3,
									description: "This is a new product",
									status: 1)
'''
		product = Product.create(product_attributes(price: 150.3))

		#visit "http://www.crossover.com/products/#{product.id}"
		visit product_url(product)

		expect(page).to have_text(product.id)
		expect(page).to have_text(product.name)
		expect(page).to have_text("150.3")
		expect(page).to have_text(product.description)
		expect(page).to have_text(product.status)

	end
end