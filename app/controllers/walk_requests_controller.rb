class WalkRequestsController < ApplicationController
  before_action :authenticate_user!

  def new
    @user_id = current_user.id
    @walk_request = WalkRequest.new
  end

  def create
    current_user.walk_requests.create(walk_request_params);
    redirect_to dashboard_path
  end

  def show
    @user=current_user
    @current_walk = WalkRequest.find(params[:id])
    @dog = @current_walk.dog
  end

  def update
    @user = User.find(4)
    this_walk_request = WalkRequest.find(params[:id])
    this_walk_request.walker_id = @user.id
    this_walk_request.save
    redirect_to dashboard_path
  end

  def edit
    @this_walk = WalkRequest.find(params[:id])
  end

  def complete_walk_request
    @this_walk = WalkRequest.find(params[:id])
    @this_walk.update(completed:1)
    current_user.increment!(:credit, 1)

    redirect_to dashboard_path
  end

  def view
    @this_walk = WalkRequest.find(params[:id])
  end

  def cancel
    @this_walk = WalkRequest.find(params[:id])
    @this_walk.destroy
    redirect_to dashboard_path
  end

  private

  def walk_request_params
    params.require(:walk_request).permit(:date, :walk_start_time, :dog_id)
  end
end
