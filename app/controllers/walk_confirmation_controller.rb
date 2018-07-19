class WalkConfirmationController < ApplicationController

  before_action :authenticate_user!

  def confirm_walk
    @user=current_user
    wr = WalkRequest.find(params[:id])
    wr.walker_id = @user.id
    wr.save
    redirect_to dashboard_path
  end

end
