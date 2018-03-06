class OrdersController < ApplicationController
   before_action :authenticate_user!
  before_action :set_order, only: [:checkout, :show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  
       
 
    @shoppingcart=current_user.orders.last
    session[:order]=@shoppingcart.id
    @invoicetotal=0
      @shoppingcart.product_orders.each do |i|
      @invoicetotal+=i.product_price.to_f*i.product_qty.to_f
      end
    
  end

  def checkout
    checkout_cart=@order
   checkout_cart.status=1
   checkout_cart.save
   @order=Order.new(status: 0, user_id: current_user.id)

   @order.save 
    
    respond_to do |format|
      if  checkout_cart.save
        format.html { redirect_to products_path, notice: 'shopping cart was successfully submitted.' }
        format.json { render :show, status: :created, location:  checkout_cart }
      else
        format.html { render :new }
        format.json { render json:  checkout_cart.errors, status: :unprocessable_entity }
      end
    end
    
  end
  
  
  
  # POST /orders
  # POST /orders.json
  def create
  
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
       params.require(:order).permit(:id, :date, :commit, :customer_id, :customer_order_no)
    end
end
