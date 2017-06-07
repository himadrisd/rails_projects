class Customer < ApplicationRecord
  self.primary_key = 'id'
  has_secure_password

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence:true, format: /\A\S+@\S+\z/,
  			uniqueness: {case_sensitive: false}

  has_many :orders, dependent: :destroy
  has_many :order_lines, through: :orders
  #has_many :orders, class_name: 'Order', foreign_key: :customer_id
  #has_many :order_list, class_name: 'Order', foreign_key: :customer_id

  	def self.authenticate(email, password)
  		customer = Customer.find_by(email: email)
  		customer && customer.authenticate(password)
  	end
end
