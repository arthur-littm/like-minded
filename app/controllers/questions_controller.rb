class QuestionsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @question = Question.new
  end

  def create
    @survey = Survey.find(params[:survey][:id])
    @question = Question.new(question_params)
    @question.user = current_user
    if @question.save
      respond_to do |format|
        format.html { redirect_to URI(request.referer).path }
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

  def survey_params
    params.require(:survey).permit(:id)
  end
end
