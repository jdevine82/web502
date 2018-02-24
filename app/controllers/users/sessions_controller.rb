# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
   def new
    super
    
   end

  def create
   super
   if (current_user.orders.count == 0) then a=current_user.orders.new 
    a.status =0
    a.user_id=current_user
   a.save 
    end
  if (current_user.orders.last.status == 0) then current_user.orders.new end
 
  
   end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
