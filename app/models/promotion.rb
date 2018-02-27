class Promotion < ActiveRecord::Base
    has_many :product_promotions
    has_many :products, through: :product_promotions
end
