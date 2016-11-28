class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = current_user
  end

  def update
    authorize @user
    if current_user.update(user_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  def sent_surveys
    @user = current_user
    @surveys = Survey.find(friends: current_user)
  end
  helper_method :find_sent_surveys

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
