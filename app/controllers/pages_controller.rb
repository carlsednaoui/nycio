class PagesController < ApplicationController
  def home
    @events = Event.from_approved_orgs.with_occurrences
    @skills = Skill.all
  end
end
