class EventsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
  	@events = Event.all
  end

  def show
  	@event = Event.find(params[:id])
  	@occurrences = @event.occurrences
  end

  def new
  	@event = Event.new
  	@user_orgs = current_user.is_admin? ? Organization.order(:name) : current_user.manager_organizations
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
  	@event = Event.find(params[:id])
  	@user_orgs = current_user.is_admin? ? Organization.order(:name) : current_user.manager_organizations
  end

  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(event_params)
        format.html { redirect_to @event, notice: 'Event Updated' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
  	@event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Removed Event' }
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :organization_id)
  end
end
