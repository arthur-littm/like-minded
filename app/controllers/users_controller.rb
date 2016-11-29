class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = current_user
    authorize @user
  end

  def update
    @user = current_user
    authorize @user
    if @user.update(user_params)
      redirect_to dashboard_path
    else
      redirect_to dashboard_path, alert: "Something went wrong"
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :photo)
  end
end
