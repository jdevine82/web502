class StaticPagesController < ApplicationController
  add_breadcrumb "home", :root_path

  def home
 
    @all_authors=Product.order(:author).all
    @all_years=Product.order(:year).all
    @books=Product.order("RANDOM()").limit(10)
    @latest_books = Product.order(created_at: :desc).where("created_at >= :start_date AND created_at <= :end_date", {start_date: Date.today<<(6), end_date: Date.today}).limit(5)
    @author_books = Product.distinct.pluck(:author).first
  end
end
