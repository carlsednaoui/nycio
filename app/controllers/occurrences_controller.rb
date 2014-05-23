class OccurrencesController < ApplicationController
	before_filter :authenticate_user!, except: [:index, :show]

	def new
		@occurrence = Occurrence.new
		@user_events = current_user.is_admin? ? Event.order(:name) : current_user.manager_events
	end

	def create
		@occurrence = Occurrence.new(occurrence_params)

		respond_to do |format|
			if @occurrence.save
				format.html { redirect_to root_path, notice: 'New Occurrence added' }
			else
				format.html { render action: 'new' }
				@user_events = current_user.is_admin? ? Event.order(:name) : current_user.manager_events
			end
		end
	end

	def edit
	end

	def update
	end

	private

	def occurrence_params
		params.require(:occurrence).permit(:start_time, :end_time, :event_id)
	end
end
