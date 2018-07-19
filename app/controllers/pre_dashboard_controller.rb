class PreDashboardController < ApplicationController

  def index
    postal_code = params[:postal_code_input]
    @your_postal_code = postal_code

    users = User.near(postal_code, 1)
    user_ids = users.map { |u| u.id }
    @num_walkers = users.length

    dogs = Dog.where(user_id: user_ids)
    @num_dogs = dogs.length
  end

  def pre_dashboard_params
    params.require(:pre_dashboard).permit(:postal_code)
  end
end
