class Event < ActiveRecord::Base
	has_many :occurrences
	belongs_to :organization
end
