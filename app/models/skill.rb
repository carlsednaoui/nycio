class Skill < ActiveRecord::Base
  has_many :event_skills, dependent: :destroy
  has_many :events, through: :event_skills

  has_many :user_skills, dependent: :destroy
  has_many :users, through: :user_skills
end
