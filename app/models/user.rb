class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :answers
  has_many :questions
  has_many :surveys
  has_many :survey_friends
  has_many :answered_surveys, through: :survey_friends

  # validates :first_name, presence: true
  # validates :last_name, presence: true
end
