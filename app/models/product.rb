class Product < ActiveRecord::Base
    has_many :product_promotion
    has_many :promotions, through: :product_promotion
    has_many :product_orders
     validates :front_page,attachment_presence: true
     has_attached_file :front_page, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: ""
     validates_attachment_content_type :front_page, content_type: /\Aimage\/.*\z/
     
end
