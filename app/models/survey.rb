class Survey < ApplicationRecord
  belongs_to :user
  has_many :survey_questions, dependent: :destroy
  has_many :questions, through: :survey_questions
  has_many :survey_friends, dependent: :destroy
  has_many :friends, through: :survey_friends
  has_many :answers, dependent: :destroy

  validates :city, presence: true

  geocoded_by :city
  after_validation :geocode, if: :city_changed?

  has_attachment :cover_picture

  accepts_nested_attributes_for :questions

  before_create :add_token

  private

  def add_token
      self.token = SecureRandom.hex[0,10].upcase
      while self.class.exists?(token: token)
    end
  end

end
