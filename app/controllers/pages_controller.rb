class PagesController < ApplicationController
  def home
    @events = Event.all
    @skills = Skill.all
  end
end
