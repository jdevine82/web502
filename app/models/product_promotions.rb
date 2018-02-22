class Product_Promotion < ActiveRecord::Base
    belongs_to :promotions
    belongs_to :products
end
