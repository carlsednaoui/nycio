class EventsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

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
