class EventsController < ApplicationController
  def index
  end

  def show
  	@event = Event.find(params[:id])
  end

  def new
  	@event = Event.new
  end

  def edit
  end
end
