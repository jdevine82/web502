class PromotionsController < ApplicationController
  before_action :set_promotion, only: [:show, :edit, :update, :destroy]

  # GET /promotions
  # GET /promotions.json
  def index
    @promotions = Promotion.all
  end

  # GET /promotions/1
  # GET /promotions/1.json
  def show
     @products=@promotion.products
  end

  # GET /promotions/new
  def new
    @promotion = Promotion.new
 @products=@promotion.products
  @product_promotions=ProductPromotion.new
  end
  
  def delete_promotion_product
    @b=ProductPromotion.id.where(promotion_id: @promotion, product_id: p)
  end

  # GET /promotions/1/edit
  def edit
        @products=@promotion.products
         @product_promotions=ProductPromotion.new
         session[:promotion]=@promotion.id
  end

  # POST /promotions
  # POST /promotions.json
  def create
  
      @promotion = Promotion.new(promotion_params)

      respond_to do |format|
      if @promotion.save
        format.html { redirect_to edit_promotion_path(@promotion), notice: 'Promotion was successfully created.' }
        format.json { render :show, status: :created, location: @promotion }
        else
        format.html { render :new }
        format.json { render json: @promotion.errors, status: :unprocessable_entity }
        end
      end
  
end #end def
  

  # PATCH/PUT /promotions/1
  # PATCH/PUT /promotions/1.json
  def update
    respond_to do |format|
      if @promotion.update(promotion_params)
        format.html { redirect_to @promotion, notice: 'Promotion was successfully updated.' }
        format.json { render :show, status: :ok, location: @promotion }
      else
        format.html { render :edit }
        format.json { render json: @promotion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /promotions/1
  # DELETE /promotions/1.json
  def destroy
    @promotion.destroy
    respond_to do |format|
      format.html { redirect_to products_path, notice: 'Promotion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_promotion
      @promotion = Promotion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def promotion_params
      params.require(:promotion).permit(:id,:start_date, :end_date,:discount_amount, :name)
    end
end
