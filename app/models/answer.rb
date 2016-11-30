class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  belongs_to :survey

  geocoded_by :location
  after_validation :geocode, if: :location_changed?
end
