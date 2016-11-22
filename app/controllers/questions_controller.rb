class QuestionsController < ApplicationController

  def index
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    @question.save
    redirect_to URI(request.referer).path
  end

  # def destroy
  #   @question = Question.find(params[:id])
  #   @question.destroy
  # end

  private

  def question_params
    params.require(:question).permit(:content, :category_id)
    #check if permit is correct, is it survey or survey_id
  end
end
