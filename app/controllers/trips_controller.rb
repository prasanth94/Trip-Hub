class TripsController < ApplicationController
  before_action :authenticate_user!

  def show
  	@trip = Trip.find(params[:id])
  end

  def index
    @trips = Trip.all.order('created_at DESC').paginate(page: params[:page])
    @followed_users = current_user.following
    @following_users = current_user.followers
    @user = current_user
  end

  def new
    @trip = Trip.new
  end

  def create
  	@trip = current_user.trips.build(trip_params)
    if @trip.save
      if params[:images]
        params[:images].each { |image|
          @trip.galleries.create(image: image)
        }
      end
    	redirect_to @trip
      flash[:success] = 'Trip created successfully'
    else
      redirect_to root_path
      flash[:danger] = 'Trip has not created'
    end
  end

  private

  def trip_params
  	params.require(:trip).permit(:name, :description, :title)
  end

  def gallery_params
    params.require(:trip).permit()
  end

end