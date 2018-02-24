class ProductOrdersController < ApplicationController
  before_action :set_product_orders, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @product_orders = ProductOrder.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product_orders = ProductOrder.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
      @productprice=Product.find(product_orders_params[:product_id]).price
      @paramsvar= product_orders_params
      @paramsvar[:product_price] =@productprice
     @addproduct =current_user.orders.last.product_orders.build(@paramsvar)
     
    if @addproduct.save
      
      flash[:success] = "Product Added!"
      redirect_to root_url
    else
      render 'products#index'
    end

  
    end
  

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product_order.update(product_orders_params)
        format.html { redirect_to  edit_order_path(Order.last), notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_order }
      else
        format.html { render :edit }
        format.json { render json: @product_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product_order.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_orders
      @product_order = ProductOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_orders_params
      params.require(:product_order).permit(:order_id, :product_id, :product_qty, :product_price)
    end
end
