class PagesController < ApplicationController
  def home
  end

  def dashboard
    @user = current_user
    authorize @user
  end

end
