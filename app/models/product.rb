class Product < ActiveRecord::Base
    has_many :promotions
    has_many :product_promotaions
    has_many :product_orders
     validates :front_page,attachment_presence: true
     has_attached_file :front_page, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: ""
     validates_attachment_content_type :front_page, content_type: /\Aimage\/.*\z/
     
end
