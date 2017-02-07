class TripsController < ApplicationController
  before_action :authenticate_user!

  def show
  	@trip = Trip.find(params[:id])
  end

  def index
  	@trips = Trip.all.order('created_at DESC')
  	@trip = Trip.new
  end


  def create
  	@trip = current_user.trips.build(trip_params)
    if @trip.save
    	redirect_to @trip
      flash[:success] = 'Trip created successfully'
    else
      redirect_to root_path
      flash[:danger] = 'Trip has not created'
    end
  end

  private

  def trip_params
  	params.require(:trip).permit(:name, :description)
  end

end