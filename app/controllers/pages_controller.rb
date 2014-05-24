class PagesController < ApplicationController
  def home
    @events = Event.from_approved_orgs.with_future_occurrences.with_skills(params[:skill_id])
    @skills = Skill.all
  end
end
