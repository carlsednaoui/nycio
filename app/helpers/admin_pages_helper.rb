module AdminPagesHelper
	def upcoming_occurrence(event)
		if event.occurrences.present?
			occurrence = event.occurrences.reorder('start_time ASC').first
			start_time = occurrence.start_time.strftime("%b %d, %Y %l:%M %p")
			end_time = occurrence.end_time.strftime("%b %d, %Y %l:%M %p")
			"#{start_time} - #{end_time}"
		else
			"None"
		end
	end
end
