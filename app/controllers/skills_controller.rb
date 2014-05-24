class SkillsController < ApplicationController
	before_filter :authenticate_user!
	before_action :run_authorize

	def new
		@skill = Skill.new
	end

	def create
		@skill = Skill.new(skill_params)

		respond_to do |format|
			if @skill.save
				format.html { redirect_to admin_skills_path, notice: 'New Skill added' }
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
