class TripsController < ApplicationController
  def show
  	@trip = Trip.find(params[:id])
  end
  def index
  	@trips = Trip.all
  	@trip = Trip.new
  end

  def create
  	@trip = Trip.new(trip_params)
    if @trip.save
    	redirect_to @trip
    end
  end

  private

  def trip_params
  	params.require(:trip).permit(:name, :description)
  end

end