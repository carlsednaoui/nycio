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

	def organization_events_list(organization)
		if organization.events.present?
			content_tag(:ul, :class => "admin-events-list") do
				list = ''
				organization.events.each do |event|
					list += content_tag(:li) do
						link_to event.name, event_path(event)
					end
				end
				raw(list)
			end
		else
			"No Upcoming Events"
		end
	end
end
