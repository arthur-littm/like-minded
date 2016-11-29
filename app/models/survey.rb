class Survey < ApplicationRecord
  belongs_to :user
  has_many :survey_questions
  has_many :questions, through: :survey_questions
  has_many :survey_friends
  has_many :friends, through: :survey_friends
  has_many :answers

  validates :city, presence: true

  geocoded_by :city
  after_validation :geocode, if: :city_changed?

  has_attachment :cover_picture

  accepts_nested_attributes_for :questions


end
