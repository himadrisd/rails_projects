require 'rails_helper'

RSpec.describe Product, type: :model do
  	#pending "add some examples to (or delete) #{__FILE__}"

	it "is not valid without a Product description:" do
		p = Product.new(description: nil)

		expect(p).to_not be_valid
	end

	it "is not valid without a Product name:" do
		p = Product.new(name: nil)

		expect(p).to_not be_valid
	end

	it "is not valid without a Product price:" do
		p = Product.new(price: nil)

		expect(p).to_not be_valid
	end

	it "is not valid without a Product status:" do
		p = Product.new(status: nil)

		expect(p).to_not be_valid
	end

end
