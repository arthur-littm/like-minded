class SurveysController < ApplicationController
  def index
  end

  def show
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(survey_params)
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
    params.require.(:survey).permit(:city, :start_date)
  end


end
