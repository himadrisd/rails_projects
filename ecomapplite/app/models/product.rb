class Product < ApplicationRecord
	self.primary_key = 'id'

	validates :name, :price, :status, presence: true
	validates :description, length: {maximum: 50}
	validates :price, numericality: {greater_than_or_equal_to: 0.00}
	validates :status, numericality: {only_integer: true, 
		greater_than_or_equal_to: 0, less_than: 2}
		#, format: {with: "//", message: "..must be 0 or 1"}

	has_many :order_lines, dependent: :destroy
	has_many :orders, through: :order_lines

end
