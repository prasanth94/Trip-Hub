require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to redirect_to new_user_session_path
      #expect(response).to have_http_status(:success)
    end
  end

  describe "GET #following" do
  	it "redirects to login page if user has not logged in" do
  		get :following
  		expect(response).to redirect_to new_user_session_path
  	end
  end

end
