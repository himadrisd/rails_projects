class OrderLine < ApplicationRecord

	validates :product_id, :unit_price, :total_price, presence: true
	validates :unit_price, numericality: {greater_than_or_equal_to: 0.00}


	belongs_to :order
	belongs_to :product

end
