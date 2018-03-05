class Promotion < ActiveRecord::Base
    has_many :product_promotions
    has_many :products, through: :product_promotions
    validates :name, :start_date, :end_date, :discount_amount, presence: true
     validates :discount_amount, numericality: {:greater_than => 0} 
end
