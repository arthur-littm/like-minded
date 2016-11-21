class SurveysController < ApplicationController
  def index
  end

  def show
    @questions = Question.all
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(city: params[:city], start_date: params[:start_date])
    @survey.user = current_user
     if @survey.save
      redirect_to survey_path(@survey)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def survey_params
    params.require(:survey).permit(:city, :start_date)
  end


end
