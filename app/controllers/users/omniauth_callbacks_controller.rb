class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
 
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in @user  #this will throw if @user is not activated
      redirect_to root_path
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to new_user_session_path
  end
end