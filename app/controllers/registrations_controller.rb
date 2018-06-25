class RegistrationsController < Devise::RegistrationsController
  # before_filter :configure_permitted_parameters, :only => [:create]

   #To change name via edit.html.erb write below code
   # protected

  #   def update_resource(resource, params)
  #     resource.update_without_password(params)
  #   end


  private

    def sign_up_params
      params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation) 
    end
    def account_update_params
      params.require(:user).permit(:email, :password, :current_password ,:password_confirmation) 
    end
end 