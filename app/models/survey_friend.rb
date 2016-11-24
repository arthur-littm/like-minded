class SurveyFriend < ApplicationRecord
  belongs_to :responder, class_name: 'User', foreign_key: 'user_id'
  belongs_to :answered_survey, class_name: 'Survey', foreign_key: 'survey_id'
end
