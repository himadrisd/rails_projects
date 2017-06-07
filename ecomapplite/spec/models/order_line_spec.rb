require 'rails_helper'

RSpec.describe OrderLine, type: :model do
  	#pending "add some examples to (or delete) #{__FILE__}"

	it "is not valid without a Order No:" do
		ol = OrderLine.new(order_id: nil)

		expect(ol).to_not be_valid
	end

	it "is not valid without a Product ID:" do
		ol = OrderLine.new(product_id: nil)

		expect(ol).to_not be_valid
	end

	it "is not valid without a Quantity:" do
		ol = OrderLine.new(qty: nil)

		expect(ol).to_not be_valid
	end

	it "is not valid without a Unit price:" do
		ol = OrderLine.new(unit_price: nil)

		expect(ol).to_not be_valid
	end

	it "is not valid without a Total amount:" do
		ol = OrderLine.new(total_price: nil)

		expect(ol).to_not be_valid
	end

end
