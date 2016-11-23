class SurveysController < ApplicationController
  before_action :authenticate_user!, except: :new

  before_action :find_survey, only: [:show, :update, :destroy]

  def index
  end

  def show
    @question = Question.new
    @friends = User.all
    @friends.each { |friend| SurveyFriend.create(survey_id: @survey.id, user_id: friend.id) }
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
    @question_ids.map! { |id| id.to_i }
    ids = @survey.questions.map { |q| q.id }

    new_questions = @question_ids - ids
    new_questions.each do |q|
      sq = SurveyQuestion.create(survey: @survey, question_id: q)
      sq.save
    end

    # binding.pry

  #   binding.pry
  #   @question_ids.any? { |id| @survey.survey_questions }

  #   if params[:survey][:category].nil?
  #     @question_ids.each do |id|
  #       id.to_i
  #       category = Category.find(Question.find(id))
  #   end
  # end

  #   category = Category.find(params[:survey][:category].to_i)
  #   @survey.survey_questions.select{|q| q.question.category == category}.each{ |q| q.delete }
  #   unless @question_ids.empty?
  #     @question_ids.each { |id| SurveyQuestion.create(survey: @survey, question_id: id.to_i) }
  #   end

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
