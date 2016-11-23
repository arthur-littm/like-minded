class AnswersController < ApplicationController


  def show
  end

  def new
    @answer = Answer.new
  end

  def create
  end

  private

  def answer_params
    params.require(:answer).permit(:user_id, :question_id, :survey_id)
  end
end
