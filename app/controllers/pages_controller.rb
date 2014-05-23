class PagesController < ApplicationController
  def home
    @events = Event.includes(:occurrences).where("occurrences.event_id IS NOT NULL").references(:occurrences)
    @skills = Skill.all
  end
end
