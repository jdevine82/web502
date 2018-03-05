class ProductPromotion < ActiveRecord::Base
    belongs_to :promotion
    belongs_to :product
    validates_uniqueness_of :product_id, :scope => :promotion_id
    validates_associated :product, :promotion
end
