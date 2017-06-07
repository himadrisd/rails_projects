require 'rails_helper'

RSpec.describe Customer, type:  :model do
  #pending "add some examples to (or delete) #{__FILE__}"
'''
	let(:user1) {Customer.create(
#		user1 = Customer.create(
					firstname: \'user1\',
  					lastname:\'l_user1\',
  					)}
	it "has many order" do
		order1 = Order.create(customer_id: user1.id,
					order_no: \'O0324325\',
					total: 100.23,
					)

		expect(user1.orders).to include(order1)
		#expect(order1.customer).to include(user1)

  	end
  	'''

	it "is not valid without a firstname" do
  		c = Customer.new(firstname: nil)

    	expect(c).to_not be_valid
  	end
	it "is not valid without a lastname" do
  		c1 = Customer.new(lastname: nil)

    	expect(c1).to_not be_valid
  	end
	it "is not valid without a email" do
  		c2 = Customer.new(email: nil)

    	expect(c2).to_not be_valid
  	end
	it "is not valid without a password_digest" do
  		c3 = Customer.new(password_digest: nil)

    	expect(c3).to_not be_valid
  	end
	it "is  valid with a admin status" do
  		c4 = Customer.new(admin: nil)

    	expect(c4).to_not be_valid
  	end
	it "is  valid with a admin status" do
  		c5 = Customer.new(admin: nil)

    	expect(c5).to_not	 be_valid
  	end

end
