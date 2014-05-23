class Occurrence < ActiveRecord::Base
	belongs_to :event

	validates :event_id, :start_time, :end_time, presence: true
end
