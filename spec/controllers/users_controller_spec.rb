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
      get :following, { id: user } 
      expect(response).to render_template :show_follow
    end

    # it "sets @users" do
    #   expect(assigns(@users)).to be_a Array
    # end

  end


  describe "#followers" do
    let(:user1) { create :user, email: "prasanth.m7@gmail.com" }

    it "renders the 'show_follow' template" do
      get :followers, { id: user } 
      expect(response).to render_template :show_follow
    end

    # it "sets @users" do
    #   expect(assigns(@users)).to be_a Array
    # end

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
    
    it "renders the 'index' template" do
      expect(response).to render_template :index
    end
  end

describe "#show" do
    before do
      get :show, {id: user}
    end
    
    it_behaves_like "common to all controller actions" do
      let(:make_request) do
        get :show, {id: user}
      end
    end
    
    it "renders the 'show' template" do
      expect(response).to render_template :show
    end
  end
  


end