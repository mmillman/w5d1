class User < ActiveRecord::Base
  attr_accessible :email, :password, :token
  validates :email, :password, presence: true
  validates :email, uniqueness: true

  has_many :orders
  has_many :product_orders, :through => :orders
  has_many :products, :through => :product_orders

  def self.generate_token
    SecureRandom.urlsafe_base64(6)
  end

  def authenticated?(other_token) # INSIDE USER MODEL
    token == other_token
  end
end
