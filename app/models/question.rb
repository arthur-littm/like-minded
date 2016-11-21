class Question < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :surveys, through: :survey_questions
end
