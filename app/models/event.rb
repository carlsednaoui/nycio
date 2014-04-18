class Event < ActiveRecord::Base
	has_many :occurrences
	has_many :event_skills, dependent: :destroy
	has_many :skills, through: :event_skills

	belongs_to :organization
end
