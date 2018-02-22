class Product_Orders < ActiveRecord::Base
    belongs_to :order
    belongs_to :customer
end