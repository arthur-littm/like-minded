class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = current_user
    authorize @user
  end

  def update
    authorize current_user
     current_user.update(user_params)
      redirect_to dashboard_path
    # else
    #   render :edit
    # end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
