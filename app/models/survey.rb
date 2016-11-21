class Survey < ApplicationRecord
  belongs_to :user
  has_many :questions through: :survey_question
  has_many :trips
end
