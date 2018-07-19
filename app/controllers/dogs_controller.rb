class DogsController < ApplicationController
  before_action :authenticate_user!
  
  def new
   @user_id = current_user.id
   @dog = Dog.new
  end

  def create
    @user_id = current_user.id
    @dog = Dog.create(dog_params.merge(user_id: @user_id))
    redirect_to dashboard_path
  end

  private
  def dog_params
    params.require(:dog).permit(:name, :weight, :breed, :date_of_birth, :temperment, :image)
  end
end
