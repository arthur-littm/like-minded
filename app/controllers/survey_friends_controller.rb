class SurveyFriendsController < ApplicationController

  before_action :find_survey, only: :destroy

  def destroy
    survey_friend = SurveyFriend.find(params[:id])
    authorize @survey
    survey_friend.destroy
    redirect_to survey_path(@survey)
  end

  private

  def find_survey
    @survey = Survey.find(params[:survey_id])
  end
end
