class SurveysController < ApplicationController

  before_action :find_survey, only: [:show, :update]

  def index
  end

  def show
    # @question = Question.first
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
    @question_ids.each { |id| SurveyQuestion.create(survey: @survey, question_id: id.to_i) }
    redirect_to survey_path(@survey)
  end

  def destroy
  end

  private

  def survey_params
    params.require(:survey).permit(:city, :start_date)
  end

  def find_survey
    @survey = Survey.find(params[:id])
  end


end
