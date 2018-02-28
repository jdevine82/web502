class ProductPromotionsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @product_promotions = ProductPromotion.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product_promotion = ProductPromotion.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @a=product_params
    @product_promotion = ProductPromotion.new(product_params)
    @promotion=session[:promotion]
    respond_to do |format|
      if @product_promotion.save
        
        format.html { redirect_to edit_promotion_path(@promotion), notice: 'Product was successfully added to the promotion' }

       else
      flash[:alert] = "unable to save this product into the promotion, perhaps it is already here?"
        format.html { redirect_to edit_promotion_path(@promotion)}

      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
      @promotion=session[:promotion]
    respond_to do |format|
      if @product_promotion.update(product_params)
       
        format.html { redirect_to edit_promotion_path(@promotion), notice: 'Product was successfully updated.' }
      
      else
        format.html { render :edit }
        format.json { render json: @product_promotion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product_promotion.destroy
     @promotion=session[:promotion]
    respond_to do |format|
      
      format.html { redirect_to edit_promotion_path(@promotion), notice: 'Product was removed from the promotion' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product_promotion = ProductPromotion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
        params.permit(:product_id,:promotion_id)
    end
end
