class Promotion < ActiveRecord::Base
    has_many :products, :through => :product_promotions
    
end
