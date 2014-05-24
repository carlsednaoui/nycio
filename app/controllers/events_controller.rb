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
        if skill_id_params.present?
          skill_id_params.each do |skill_id|
            EventSkill.find_or_create_by(event_id: @event.id, skill_id: skill_id)
          end
        end

        format.html { redirect_to root_path, notice: 'New Event added' }
      else
        format.html { render action: 'new' }
        @user_orgs = current_user.is_admin? ? Organization.order(:name) : current_user.manager_organizations
      end
    end
  end

  def edit
  	@event = Event.find(params[:id])
  	@user_orgs = current_user.is_admin? ? Organization.order(:name) : current_user.manager_organizations
  	authorize! :manage, @event
  end

  def update
    @event = Event.find(params[:id])
    authorize! :manage, @event

    respond_to do |format|
      if @event.update_attributes(event_params)
        if skill_id_params.present?
          original_array = @event.event_skills.pluck(:skill_id)
          skill_id_params.each do |skill_id|
            EventSkill.find_or_create_by(event_id: @event.id, skill_id: skill_id)
          end
          (original_array - skill_id_params).each do |skill_id|
            EventSkill.where(event_id: @event.id, skill_id: skill_id)[0].destroy
          end
        end

        format.html { redirect_to @event, notice: 'Event Updated' }
      else
        format.html { render action: 'edit' }
        @user_orgs = current_user.is_admin? ? Organization.order(:name) : current_user.manager_organizations
      end
    end
  end

  def destroy
  	@event = Event.find(params[:id])
    authorize! :manage, @event
    @event.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Removed Event' }
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :organization_id)
  end

  def skill_id_params
    int_array = params[:skill_id].collect{|i| i.to_i}
    Skill.pluck(:id) & int_array == int_array ? int_array : []
  end
end
