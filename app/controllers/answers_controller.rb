class AnswersController < ApplicationController


  def show
    authorize @answer
  end

  def new
    @answer = Answer.new
    authorize @answer
  end

  def create
    authorize @answer
  end

  private

  def answer_params
    params.require(:answer).permit(:user_id, :question_id, :survey_id, answers_attributes: [:content])
  end
end
