class DashboardController < ApplicationController
  before_action :authenticate_user!
    def index
        if current_user
            @user_id = current_user.id
            @user = User.find(@user_id)
            @user_credit = current_user.credit
            @user_name = current_user.first_name
            @restricted_times = WalkRequest.where(walker_id: @user.id)
            is_restricted = false;

            @dog = @user.dogs[0]

            @available_walks = WalkRequest.where.not(user_id: @user.id).where(walker_id: nil).where('date>=?', Date.today)

            @user_walks = WalkRequest.where(walker_id: @user.id).where(completed: nil).where('date>=?', Date.today)

        else
          redirect_to join_path, notice: 'You are not logged in'
        end
    end

end
