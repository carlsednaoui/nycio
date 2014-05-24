class PagesController < ApplicationController
  def home
    @events = Event.from_approved_orgs.with_future_occurrences
    @skills = Skill.all
  end
end
