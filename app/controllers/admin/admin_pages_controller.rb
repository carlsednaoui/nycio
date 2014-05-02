module Admin
	class AdminPagesController < ApplicationController
		def organizations
			@organizations = Organization.all
		end

		def events
			@events = Event.all
		end

		def users
			@users = User.all
		end
	end
end
