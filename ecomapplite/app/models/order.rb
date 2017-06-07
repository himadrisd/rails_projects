class Order < ApplicationRecord
	#has_many :order_lines

	validates :order_no, :total, :date, presence: true
	validates :total, numericality: {greater_than_or_equal_to: 0.00}

	has_many :order_lines, dependent: :destroy
	has_many :products, through: :order_lines
	
	belongs_to :customer

	PAYMENT_TYPES = [
		[ "Bank-Wire Transfer/TT", "tt" ],
		[ "Credit card", "cc" ],
		[ "Cash on delivery", "cd"]
	]

	def self.new_order
		@@order = Order.new
	end
end
