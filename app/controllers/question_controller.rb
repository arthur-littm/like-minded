class QuestionController < ApplicationController
  before_action :get_survey_id

  def index
    @all_questions = survey.questions
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.question.create(question_params)
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
    @question = Question.find(params[:id])
  end
end
