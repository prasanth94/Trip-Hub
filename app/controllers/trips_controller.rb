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

  def edit
    @trip = Trip.find(params[:id])  
  end

  def update
     respond_to do |format|
      @trip = Trip.find(params[:id])  
      if @trip.update(trip_params)
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { render :edit }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    respond_to do |format|
      format.html {redirect_to root_path, notice: 'Trip was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  def new
    @trip = Trip.new
  end

  def create
  	@trip = current_user.trips.build(trip_params)
    if @trip.save
      if params[:images]
        params[:images].each { |image| @trip.galleries.create(image: image) }
      end
    	redirect_to @trip
      flash[:success] = 'Trip created successfully'
    else
      render :new
      flash[:danger] = 'Trip has not created'
    end
  end

  private

  def trip_params
  	params.require(:trip).permit(:name, :description, :title)
  end

end