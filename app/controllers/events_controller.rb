class EventsController < ApplicationController
  def index
  end

  def edit
  end

  def show
  	@event = Event.find(params[:id])
  end

  def new
  end
end
