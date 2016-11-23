class SurveyQuestionsController < ApplicationController
  before_action :find_survey, only: :destroy

  def destroy
    survey_question = SurveyQuestion.find(params[:id])
    survey_question.destroy
    redirect_to survey_path(@survey)
  end

  private

  def find_survey
    @survey = Survey.find(params[:survey_id])
  end
end
