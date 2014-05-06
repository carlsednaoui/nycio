module Admin
	class AdminPagesController < ApplicationController
		before_action :authenticate_user!
		before_action :run_authorize
		helper_method :sort_column, :sort_direction
		
		def organizations
			organizations = Organization.all
			@organizations = organizations.order(sort_column + " " + sort_direction)
		end

		def events
			events = Event.all
			if sort_column == "organization"
				@events = events.includes(:organization).reorder("organizations.name " + sort_direction).references(:organization)
			else
				@events = events.order(sort_column + " " + sort_direction)
			end
		end

		def users
			@users = User.all
		end

		private

		def run_authorize
			authorize! :manage, :all
		end

		def sort_column
			%w[name organization].include?(params[:sort]) ? params[:sort] : "updated_at"
		end

		def sort_direction
			%w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
		end
	end
end
