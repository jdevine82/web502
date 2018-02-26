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
  end

  # GET /promotions/new
  def new
    @promotion = Promotion.new
    @products=Product.all
  end

  # GET /promotions/1/edit
  def edit
        @products=Product.all
  end

  # POST /promotions
  # POST /promotions.json
  def create
      @promotion = Promotion.new(promotion_params)
    if  params[:product_ids].present? 
    
       @params=params[:product_ids]
        @params.each do |value|
           @addproduct = @promotion.product_promotions.build(:product_id => value)
           @addproduct.save
         end
      respond_to do |format|
      if @promotion.save
        format.html { redirect_to @promotion, notice: 'Promotion was successfully created.' }
        format.json { render :show, status: :created, location: @promotion }
        else
        format.html { render :new }
        format.json { render json: @promotion.errors, status: :unprocessable_entity }
        end
      end
  else
  redirect_to @promotion, notice: 'You must put some products in the promotion!' 
  end #end else
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
      format.html { redirect_to promotions_url, notice: 'Promotion was successfully destroyed.' }
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
      params.require(:promotion).permit(:start_date, :end_date, :product_ids,:discount_amount)
    end
end
