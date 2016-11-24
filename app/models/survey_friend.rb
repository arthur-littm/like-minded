class SurveyFriend < ApplicationRecord
  belongs_to :user
  belongs_to :answered_survey, class_name: 'Survey', foreign_key: 'survey_id'
  belongs_to :friend, class_name: 'User', foreign_key: 'user_id'
end
