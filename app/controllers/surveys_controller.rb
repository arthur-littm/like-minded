class SurveysController < ApplicationController
  before_action :authenticate_user!, except: [ :new ]

  before_action :find_survey, only: [:show, :update, :update_friends, :destroy,
    :answering, :preview, :update_status, :answer_update, :update_cover_picture,
    :reverse_status]

    def index

    end

    def show
      @question = Question.new
      authorize @survey
    end

    def new
      @survey = Survey.new
      authorize @survey
    end

    def create
      @survey = Survey.new(survey_params)
      @survey.user = current_user
      authorize @survey
      if @survey.save
        redirect_to survey_path(@survey)
      else
        render :new
      end
    end

    def answering
      authorize @survey
      if @survey.user == current_user
        redirect_to survey_path(@survey), alert: "You can't answer your own survey!"
      end
    end

    def preview
      authorize @survey
    end

    def answer_update
      authorize @survey
      params[:survey][:questions_attributes].each do |k,v|
        q = Question.find(v[:id].to_i)
        answer = Answer.new(question: q, content: v['answers_attributes']['0'][:content], location: v['answers_attributes']['0'][:location])
        answer.update(question_id: q.id)
        answer.user = current_user
        answer.survey = @survey
        answer.save
      end
      redirect_to root_path, notice: "Thanks for your tips, try LikeMinded yourself!"
    end

    def update
      authorize @survey
      @question_ids = params[:survey][:question_ids].reject{ |id| id.blank? }
      @question_ids.map! { |id| id.to_i }
      ids = @survey.questions.map { |q| q.id }
      new_questions = @question_ids - ids
      new_questions.each do |q|
        sq = SurveyQuestion.create(survey: @survey, question_id: q)
        authorize sq
        sq.save
      end
      redirect_to survey_path(@survey)
    end

    def update_friends
      authorize @survey
      friend_ids = params[:survey][:friend_ids].select{|id| !id.blank?}
      friend_ids.map! { |id| id.to_i }
      ids = @survey.friends.map { |r| r.id }
      new_friends = friend_ids - ids
      new_friends.each do |r|
        sr = SurveyFriend.create(answered_survey: @survey, user_id: r)
        sr.save
      end
      redirect_to survey_path(@survey)
    end

    def destroy
      authorize @survey
      @survey.destroy
      redirect_to (request.referrer + "#mytrips"), notice: "Survey deleted"
    end

    def update_status
      authorize @survey
      if @survey.status.downcase == "select questions"
        @survey.status = "Share survey"
      elsif @survey.status.downcase == "share survey"
        @survey.status = "Sent"
        UserMailer.answer(@survey).deliver_now
      end
      @survey.save
      redirect_to survey_path(@survey)
    end

    def original_url
      base_url + original_fullpath
    end

    def reverse_status
      authorize @survey
      if @survey.status.downcase == "share survey"
        @survey.status = "Select questions"
      end
      @survey.save
      redirect_to survey_path(@survey)
    end

    def update_cover_picture
      authorize @survey
      @survey.update(survey_params)
      if @survey.save
        redirect_to request.referrer
      end
    end

    private

    def survey_params
      params.require(:survey).permit(:city, :start_date, :cover_picture)
    end

    def find_survey
      @survey = Survey.find(params[:id])
    end
  end

