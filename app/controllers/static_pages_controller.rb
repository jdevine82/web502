class StaticPagesController < ApplicationController
  def home
    @all_authors=Product.order(:author).all
    @all_years=Product.order(:year).all
    
  end
end
