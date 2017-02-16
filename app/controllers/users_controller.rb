class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :following, :followers]

  def index
  	@users = User.all
  end
  def show
  	@user = User.find(params[:id])
  end
  
  def following
  	@title = "Following"
  	@user = User.find(params[:id])
  	@users = @user.following.paginate(page: params[:page])
  	render 'show_follow'
  end
  def followers
  	@title = "Followers"
  	@user = User.find(params[:id])
  	@users = @user.following.paginate(page: params[:page])
  	render 'show_follow'
  end
end
