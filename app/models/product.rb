class Product < ActiveRecord::Base
    has_many :product_promotion
    has_many :promotions, through: :product_promotion
    has_many :product_orders
     validates :front_page,attachment_presence: true
     has_attached_file :front_page, styles: { medium: "300x300>", thumb: "100x100#" ,large: "150x300^"}, :convert_options => {
    :large => "-quality 75 -strip" },default_url: ""
     validates_attachment_content_type :front_page, content_type: /\Aimage\/.*\z/
     validates :name, :title, :year, :publisher, :description, :price, presence: true
     validates :price, numericality: {:greater_than => 0} 
     
end

