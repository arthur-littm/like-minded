class SurveysController < ApplicationController
  before_action :authenticate_user!, except: :new

  before_action :find_survey, only: [:show, :update, :destroy]

  def index
  end

  def show
    @question = Question.new
  end

  def new
    @survey = Survey.new
  end

  def create
    # binding.pry
    @survey = Survey.new(survey_params)
    @survey.user = current_user
     if @survey.save
      redirect_to survey_path(@survey)
    else
      render :new
    end
  end

  # def edit
  # end

  def update
    @question_ids = params[:survey][:question_ids].select{|id| !id.blank?}
    @survey.survey_questions.each { |q| q.delete }
    @question_ids.each { |id| SurveyQuestion.create(survey: @survey, question_id: id.to_i) }
    redirect_to survey_path(@survey)
  end

  def destroy
    @survey.delete
  end

  private

  def survey_params
    params.require(:survey).permit(:city, :start_date)
  end

  def find_survey
    @survey = Survey.find(params[:id])
  end


end
