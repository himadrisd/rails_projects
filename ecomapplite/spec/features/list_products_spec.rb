require 'rails_helper'

describe "Viewing list of the products" do
	it " -> shows products" do

		product1 = Product.create(	name: "New Product",
									id: 1,
									price: 150.3,
									description: "This is a new product",
									status: 1)

		product2 = Product.create(	name: "New Product1",
									id: 2,
									price: 250.3,
									description: "This is a old product",
									status: 0)

		#visit "http://www.crossover.com/products"
		visit products_url

		expect(page).to have_text("2 Products")
		expect(page).to have_text(product1.id)
		expect(page).to have_text(product1.name)
		expect(page).to have_text(product1.price)
		expect(page).to have_text(product1.description)
		expect(page).to have_text(product1.status)

		expect(page).to have_text(product2.id)
		expect(page).to have_text(product2.name)
		expect(page).to have_text(product2.price)
		expect(page).to have_text(product2.description)
		expect(page).to have_text(product2.status)
	end
end