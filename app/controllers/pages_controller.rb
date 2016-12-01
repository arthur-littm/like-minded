class PagesController < ApplicationController
  def home
  end

  def dashboard
    @user = current_user
    authorize @user

    @surveys = Survey.where.not(latitude: nil, longitude: nil)
    @survey = @surveys.last


    @hash = Gmaps4rails.build_markers(@user.surveys) do |survey, marker|
      marker.lat survey.latitude
      marker.lng survey.longitude

    @users = User.where.not(latitude: nil, longitude: nil)

    end
  end

end
