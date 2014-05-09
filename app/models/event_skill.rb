class EventSkill < ActiveRecord::Base
	belongs_to :event
	belongs_to :skill
end
