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
        format.html { render "surveys/question_form" }
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
    # if @question.save
    #   redirect_to survey_path(@survey)
    # else
    #   render :edit
    # end
    if @question.save
      respond_to do |format|
        format.html { redirect_to survey_path(@survey) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.js
      end
    end
  end

  def destroy
    @survey = Survey.find(params[:survey_id])
    @question = Question.find(params[:id])
    authorize @question
    @question.user = current_user
    @question.delete
    redirect_to survey_path(@survey), notice: "Question successfully deleted"
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
