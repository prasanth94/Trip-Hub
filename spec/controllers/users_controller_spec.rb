require 'rails_helper'
include ActionDispatch::TestProcess
RSpec.describe UsersController, type: :controller do

  let(:user) { create :user }

  before do
    sign_in user
  end

  describe "#following" do
    let(:user1) { create :user, email: "prasanth.m7@gmail.com" }

    it "renders the 'show_follow' template" do
      post :following, params: { id: user1 } 
      expect(response).to render_template :show_follow
    end
  end

  describe "#index" do
    before do
      get :index
    end
    
    it_behaves_like "common to all controller actions" do
      let(:make_request) do
        get :index
      end
    end
    
    # it "sets @users" do
    #   expect(assigns(:users)).to be_a Array
    # end
    
    it "renders the 'index' template" do
      expect(response).to render_template :index
    end
  end


  


end