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

  def destroy
    authorize @answer
    @survey = Survey.find(params[:survey_id])
    @answer = Answer.find(params[:id])
    @answer.delete
    redirect_to survey_path(@survey)
  end

  private

  def answer_params
    params.require(:answer).permit(:content, :location) # answers_attributes: [:content])
  end
end
