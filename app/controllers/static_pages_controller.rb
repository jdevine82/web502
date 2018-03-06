class StaticPagesController < ApplicationController

  add_breadcrumb "home", :root_path

  def home
 
    @all_authors=Product.select('DISTINCT author').order(:author)
    @all_years=Product.select('DISTINCT year').order(:year)
    @books=Product.order("RANDOM()").limit(10)
    @latest_books = Product.order(created_at: :desc).where("created_at >= :start_date AND created_at <= :end_date", {start_date: Date.today<<(6), end_date: Date.today+1.day}).limit(5)
    @author_books = Product.distinct.pluck(:author).first
  end
  
  def about
    
  end
end
