class Question < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :category
  has_many :surveys, through: :survey_questions
end
