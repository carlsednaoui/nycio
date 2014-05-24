class Event < ActiveRecord::Base
	has_many :occurrences, dependent: :destroy
	has_many :event_skills, dependent: :destroy
	has_many :skills, through: :event_skills

	belongs_to :organization

	validates :name, :description, :organization_id, presence: true

	def self.from_approved_orgs
		joins(:organization).where("organizations.approved" => true)
	end

	def self.with_occurrences
		includes(:occurrences).where("occurrences.event_id IS NOT NULL").references(:occurrences)
	end
end
