class RegistrationsController < Devise::RegistrationsController
  
private
def account_update_params
			params.require(:user).permit(:profile_pic,:password,:password_confirmation,:current_password)
    end

end 