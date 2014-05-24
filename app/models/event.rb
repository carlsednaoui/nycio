class Event < ActiveRecord::Base
	has_many :occurrences, dependent: :destroy
	has_many :event_skills, dependent: :destroy
	has_many :skills, through: :event_skills

	belongs_to :organization

	validates :name, :description, :organization_id, presence: true

	def self.from_approved_orgs
		joins(:organization).where("organizations.approved" => true)
	end

	def self.with_future_occurrences
		includes(:occurrences).where("occurrences.start_time > ?", Time.now).references(:occurrences)
	end
end
