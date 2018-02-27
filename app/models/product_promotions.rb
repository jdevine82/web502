class ProductPromotion < ActiveRecord::Base
    belongs_to :promotion
    belongs_to :product
end
