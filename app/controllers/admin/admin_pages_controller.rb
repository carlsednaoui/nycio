module Admin
	class AdminPagesController < ApplicationController
		before_action :authenticate_user!
		
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
