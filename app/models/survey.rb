class Survey < ApplicationRecord
  belongs_to :user
  has_many :survey_questions
  has_many :questions, through: :survey_questions
  has_many :survey_friends
  has_many :responders, through: :survey_friends
  has_many :answers
end
