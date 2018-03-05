class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  add_breadcrumb "products", :products_path
 
  # GET /products
  # GET /products.json
  def index
  
   add_breadcrumb "products", :products_path
    if params[:latest].present?
     @products=Product.where("created_at >= :start_date AND created_at <= :end_date", {start_date: Date.today<<(6), end_date: Date.today}) 
   
    elsif params[:author].present?
     @products=Product.where(:author =>params[:author]) 
     
    elsif params[:year].present?
     @products=Product.where(:year =>params[:year])
    
   else
    @products=Product.all
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
  add_breadcrumb "product", :product_path
  if Promotion.joins(product_promotions: [:product]).where('product_id= ? AND start_date < ? AND end_date > ?',@product,Date.today,Date.today).exists? then
  @discountamount=Promotion.joins(product_promotions: [:product]).where('product_id= ? AND start_date < ? AND end_date > ?',@product,Date.today,Date.today).first.discount_amount
  @productadjustedprice = @product.price-(@discountamount/100*@product.price)
  else
  @productadjustedprice = nil
  end
   
   @addproduct=Order.last.product_orders.build
  end

  # GET /products/new
  def new
    @product = Product.new
  
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
   params.require(:product).permit(:name,:latest, :author, :title, :year, :publisher,:description, :price, :front_page)
    end
end
