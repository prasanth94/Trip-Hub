require 'rails_helper'

RSpec.describe TripsController, type: :controller do

	describe '#index' do
		it "will get the method index" do
			get :index
			expect(response).to have_http_status(200)
		end
	end

 #  describe 'Post #create' do
	# 	context "with valid params" do
	# 		it "creates a new trip" do
	# 			trip = build(:valid_trip)
	# 			expect {
 #        post :create, params: { trip: trip}
 #        }.to change(Trip, :count).by(1)
	# 		end
	# 	end
	# end
	

	describe '#show' do
		it "will get the method show" do
			trip = create(:trip)
			get :show, {id: trip}
			expect(response).to have_http_status(200)
		end
	end
end
