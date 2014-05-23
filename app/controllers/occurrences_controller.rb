class OccurrencesController < ApplicationController
	def new
		@occurrence = Occurrence.new
	end

	def create
		@occurrence = Occurrence.new(occurrence_params)

		respond_to do |format|
			if @occurrence.save
				format.html { redirect_to root_path, notice: 'New Occurrence added' }
			else
				format.html { render action: 'new' }
			end
		end
	end

	def edit
	end

	def update
	end

	private

	def occurrence_params
		params.require(:event).permit(:start_time, :end_time, :event_id)
	end
end
