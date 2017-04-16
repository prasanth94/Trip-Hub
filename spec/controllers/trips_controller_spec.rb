 require 'rails_helper'
 require 'pp'
RSpec.describe TripsController, type: :controller do


  let(:user) { create :user }

  before do
    sign_in user
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
    
    # it "sets @trips" do
    #   expect(assigns(:trips)).to be_a Array
    # end
    
    it "renders the 'index' template" do
      expect(response).to render_template :index
    end
  end


  describe "#new" do
    before do
      get :new
    end

    it_behaves_like  "common to all controller actions" do
      let(:make_request) do
        get :new
      end
    end

    it "sets @trip" do
      expect(assigns(:trip)).to be_a_new(Trip)
    end

    it "renders the 'new' template" do
      expect(response).to render_template :new
    end
  end


  describe "#create" do
    
    let(:params_for_create) { build(:trip) }

    it_behaves_like "common to all controller actions" do
      let(:make_request) do
        post :create, params: { trip: params_for_create }
      end
    end

    xit do
      is_expected.to permit(
        :name, 
        :description, 
        :title
      ).for :create, params: params_for_create
    end

    it "redirects to the new trips page on successful Trip creation" do
      post :create, params: { trip: params_for_create }
      
      expect(response).to redirect_to trip 
    end

    it "creates a new trip" do
      expect {
        post :create, params: { trip: params_for_create }
        }.to change(Trip, :count).by(1)
      # expect{ post :create, params_for_create }.
      #   to change{ Trip.count }.by(1)
    end

    # it "sets the owner of the vehicle" do
    #   post :create, params_for_create

    #   expect(Vehicle.last.owner).to eq borrower
    # end

    it "renders the 'new' template on Trip creation failure" do
      allow_any_instance_of(Trip).to receive(:save) { false }

      post :create, params: { trip: params_for_create }

      expect(response).to render_template :new
    end
  end





  describe "#update" do
    let(:trip) { FactoryGirl.create(:trip) }

    it 'does something' do
      pp trip.name
    end

    let(:params_for_update) do
      {
        id: trip.id,
        name: trip.name,
        description: "Arunachal Pradesh"
      }
    end

    it_behaves_like "common to all controller actions" do
      let(:make_request) do
        patch :update, params_for_update
      end
    end

    context "successful requests" do
      before do
        patch :update, params_for_update
      end
  
      it "updates the trip" do
        puts trip.to_yaml
        expect(trip.reload.description).to eq params_for_update[:trip][:description]
      end

      it "redirects to the trip show page" do
        expect(response).to redirect_to trip
      end
    end

  end



  describe "#destroy" do
    let!(:trip) { create :trip }

    it_behaves_like "common to all controller actions" do
      let(:make_request) do
        delete :destroy, id: trip.id
      end
    end

    it "deletes the trip" do
      expect { delete :destroy, id: trip.id }.to change(Trip, :count).by -1
    end

    it "sets @trip" do
      delete :destroy, id: trip.id

      expect(assigns(:trip)).to be_a Trip
    end

    it "redirects to the index action" do
      delete :destroy, id: trip.id

      expect(response).to redirect_to root_path
    end
  end


  
  # describe '#index' do
  #   context "when user is logged in" do
  #     login_user
  #     it "will get the method index" do
  #       get :index
  #       expect(subject.current_user).to_not eq(nil)
  #       expect(response).to have_http_status(200)
  #       expect(response).to render_template :index
  #     end
  #   end

  #   context "when user is not logged in" do
  #     it "will not get the method index" do
  #       get :index
  #       expect(response).to have_http_status(302)
  #       expect(response).to redirect_to '/users/sign_in' 
  #     end
  #   end

  # end

  # describe 'Post #create' do
  #    login_user
  #   context "with valid params" do
  #     let(:trip) { build(:trip) }
  #     it "creates a new trip" do
  #       expect {
  #       post :create, params: { trip: trip }
  #       }.to change(Trip, :count).by(1)
  #     end
  #   end
  # end
  

#   describe '#show' do
#     context "when user is logged in" do
#       login_user
#       it "will get the method show" do
#         trip = create(:trip)
#         get :show, { id: trip }
#         expect(response).to have_http_status(200)
#         expect(response).to render_template :show
#       end
#     end

#     context "when user is not logged in" do
#       it "will not get the method show" do
#         trip = create(:trip)
#         get :show, { id: trip }
#         expect(response).to have_http_status(302)
#         expect(response).to redirect_to '/users/sign_in' 
#       end
#     end
#   end

end
