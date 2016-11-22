class QuestionsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    if @question.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'surveys/show' }
        format.js
      end
    end
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
