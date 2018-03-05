class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :vip_number, :address, :password, :current_password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :vip_number, :address, :password, :current_password, :password_confirmation)
  end
  
   def after_sign_up_path_for(resource)

   
          
       if ((current_user.orders.count == 0) or (current_user.orders.count == nil) or  (current_user.orders.status == 0)) then  
        
    a=Order.new
    a.status=0
   a.user_id=current_user.id
    a.save 
    
    end
       super(resource)
   end
end