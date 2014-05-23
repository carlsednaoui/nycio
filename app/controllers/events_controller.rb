class EventsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
  	@events = Event.all
  end

  def show
  	@event = Event.find(params[:id])
  end

  def new
  	@event = Event.new
  end

  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to root_path, notice: 'New Event added' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def edit
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :organization_id)
  end
end
