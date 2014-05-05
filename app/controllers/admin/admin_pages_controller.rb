module Admin
	class AdminPagesController < ApplicationController
		before_action :authenticate_user!
		before_action :run_authorize
		
		def organizations
			@organizations = Organization.all
		end

		def events
			@events = Event.all
		end

		def users
			@users = User.all
		end

		private

		def run_authorize
			authorize! :manage, :all
		end
	end
end
