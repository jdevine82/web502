class Order < ActiveRecord::Base
    belongs_to :user
    has_many :product_orders
    validates_associated :user
  
end
