require 'rails_helper'
RSpec.describe TripsController, type: :controller do

  describe '#index' do
    context "when user is logged in" do
      login_user
      it "will get the method index" do
        get :index
        expect(subject.current_user).to_not eq(nil)
        expect(response).to have_http_status(200)
        expect(response).to render_template :index
      end
    end

    context "when user is not logged in" do
      it "will not get the method index" do
        get :index
        expect(response).to have_http_status(302)
        expect(response).to redirect_to '/users/sign_in' 
      end
    end

  end

  # describe 'Post #create' do
  #    login_user
  #   context "with valid params" do
  #     it "creates a new trip" do
  #       trip = build(:valid_trip)
  #       expect {
  #       post :create, params: { trip: trip}
  #       }.to change(Trip, :count).by(1)
  #     end
  #   end
  # end
  

  describe '#show' do
    context "when user is logged in" do
      login_user
      it "will get the method show" do
        trip = create(:trip)
        get :show, { id: trip }
        expect(response).to have_http_status(200)
        expect(response).to render_template :show
      end
    end

    context "when user is not logged in" do
      it "will not get the method show" do
        trip = create(:trip)
        get :show, { id: trip }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to '/users/sign_in' 
      end
    end
  end

end
