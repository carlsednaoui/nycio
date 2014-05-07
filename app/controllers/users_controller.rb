class UsersController < ApplicationController
	before_filter :authenticate_user!, except: [:show]

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
		authorize! :manage, @user
	end

	def update
		@user = User.find(params[:id])
		authorize! :manage, @user

		if skill_id_params.present?
			skill_id_params.each do |skill_id|
				UserSkill.find_or_create_by(user_id: @user.id, skill_id: skill_id)
			end
		end

		respond_to do |format|
			if @user.update_attributes(user_params)
				format.html { redirect_to @user, notice: 'Account Updated Successfully' }
			else
				format.html { render action: 'edit' }
			end
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy

		respond_to do |format|
			format.html { redirect_to root_path, notice: 'Removed User' }
		end
	end

	private

	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation,
									 :first_name, :last_name, :birthdate,
									 :gender, :phone)
	end

	def skill_id_params
		int_array = params[:skill_id].collect{|i| i.to_i}
		Skill.pluck(:id) & int_array == int_array ? params[:skill_id] : []
	end
end
