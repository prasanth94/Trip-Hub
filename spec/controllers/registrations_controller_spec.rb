require 'rails_helper'
include ActionDispatch::TestProcess
RSpec.describe RegistrationsController, type: :controller do
	context "Profile pic upload" do
		login_user
		it "can upload the profile pic" do
			user = create(:user)
			get :edit
			profile_pic = Rack::Test::UploadedFile.new('spec/images/test_img.png', 'image/png')

			put :update, params: {user: user}
			# put :update, params: { user: { profile_pic: profile_pic, 
			# 											password: user.password, password_confirmation: user.password, 
			# 											current_password: user.password} }
		end 
  end
end
