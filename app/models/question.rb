class Question < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :category
  has_many :survey_questions
  has_many :surveys, through: :survey_questions
  has_many :answers

  accepts_nested_attributes_for :answers
end
