class PagesController < ApplicationController
  def events
    @events = Event.all
    @skills = Skill.all
  end

  def show_event
    @event = Event.find(params[:id])
  end

  def organizations
    @organizations = Organization.all
  end

  def show_organization
    @organization = Organization.find(params[:id])
  end
end
