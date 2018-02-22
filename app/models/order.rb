class Order < ActiveRecord::Base
    belongs_to :customer
    has_many :product_orders
   has_many :customers, :through => :product_orders
end
