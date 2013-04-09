class Order < ActiveRecord::Base
  attr_accessible :user_id, :product_ids


  belongs_to :user
  has_many :product_orders
  has_many :products, :through => :product_orders
end
