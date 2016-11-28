class QuestionsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @question = Question.new
    authorize @question
  end

  def create
    @survey = Survey.find(params[:survey][:id])
    @question = Question.new(question_params)
    authorize @question
    @question.user = current_user

    if @question.save
      respond_to do |format|
        format.html { redirect_to survey_path(@survey) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'surveys/show' }
        format.js
      end
    end
  end

  def edit
    @survey = Survey.find(params[:survey_id])
    @question = Question.find(params[:id])
    @question.user = current_user
    authorize @question
  end

  def update
    @survey = Survey.find(params[:survey_id])
    @question = Question.find(params[:id])
    authorize @question
    @question.user = current_user
    @question.update(question_params)
    if @question.save
      redirect_to survey_path(@survey)
    else
      redirect_to survey_path(@survey), alert: "There was an error updating your question."
    end
  end

  def destroy
    @survey = Survey.find(params[:survey_id])
    @question = Question.find(params[:id])
    authorize @question
    @question.user = current_user
  unless  @survey.questions.include?(@question)
      @question.delete
      redirect_to survey_path(@survey), notice: "Question successfully deleted"
    else
      redirect_to survey_path(@survey), alert: "This question can not be deleted because it's already been added to your trip!"
    end
  end

  private

  def question_params
    params.require(:question).permit(:content, :category_id)
    #check if permit is correct, is it survey or survey_id
  end

  def survey_params
    params.require(:survey).permit(:id)
  end
end
