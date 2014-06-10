class SkillsController < ApplicationController
	before_filter :authenticate_user!
	# before_action :run_authorize

  def index
  end

	def new
		@skill = Skill.new
	end

	def create
		@skill = Skill.new(skill_params)

		respond_to do |format|
			if @skill.save
				format.html { redirect_to admin_skills_path, notice: 'New Skill added' }
        format.js { redirect_to new_events_path, notice: 'New skill has been added' } # when used from events controller TODO -> better fix needed
			else
				format.html { render action: 'new' }
			end
		end
	end

	def destroy
		@skill = Skill.find(params[:id])
		@skill.destroy

		respond_to do |format|
			format.html { redirect_to admin_skills_path, notice: 'Removed Skill' }
		end
	end

	private

	def skill_params
		params.require(:skill).permit(:name)
	end

	def run_authorize
		authorize! :manage, :all
	end
end
