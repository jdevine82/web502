class ProductOrder < ActiveRecord::Base
    belongs_to :order
    belongs_to :product
   validates_associated :order, :product
   validates :product_qty, :product_price, presence: true
   validates :product_qty, numericality: {:greater_than => 0}
   end