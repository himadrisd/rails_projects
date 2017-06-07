require 'rails_helper'

RSpec.describe Order, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  
  	it "is not valid without a Order No:" do
  		o = Order.new(order_no: nil)

    	expect(o).to_not be_valid
  	end
  	it "is not valid without a Customer ID" do
  		o1 = Order.new(customer_id: nil)

    	expect(o1).to_not be_valid
  	end

  	it "is not valid without a total price" do
  		o2 = Order.new(total: nil)

    	expect(o2).to_not be_valid
  	end

  	it "is not valid without a Date" do
		o3 = Order.new(date: nil)

		expect(o3).to_not be_valid
  	end

end
