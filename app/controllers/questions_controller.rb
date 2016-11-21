class QuestionsController < ApplicationController
  before_action :get_survey_id

  def index
    @all_questions = survey.questions
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.question.build(question_params)
    if @question.save
      redirect_to question_index_path
    else
      render :new
    end
  end

  # def destroy
  #   @question = Question.find(params[:id])
  #   @question.destroy
  # end

  private

  def get_survey_id
    @survey = Survey.find(params[:survey_id])
  end

  def question_params
    params.require(:question).permit(:user_id, :survey_id, :category)
    #check if permit is correct, is it survey or survey_id
  end
end
