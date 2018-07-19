class UsersController < ApplicationController
before_action :authenticate_user!
  def edit
    @user_id = current_user.id
    @user = User.find(@user_id)
  end

  def update
    @user_id = current_user.id
    @user = User.find(@user_id)
    @user.update(user_params)
    redirect_to dashboard_path
  end

	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :address_line_one, :postal_code)
	end

end
