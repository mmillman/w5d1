class Product < ActiveRecord::Base
  attr_accessible :name, :price
  validates :name, presence: true

  has_many :product_orders
  has_many :orders, :through => :product_orders
end
