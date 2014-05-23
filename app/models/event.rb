class Event < ActiveRecord::Base
	has_many :occurrences, dependent: :destroy
	has_many :event_skills, dependent: :destroy
	has_many :skills, through: :event_skills

	belongs_to :organization

	validates :name, :description, :organization_id, presence: true
end
