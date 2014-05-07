class Users::RegistrationsController < Devise::RegistrationsController
	def create
		super
		if skill_id_params.present?
			skill_id_params.each do |skill_id|
				UserSkill.find_or_create_by(user_id: resource.id, skill_id: skill_id)
			end
		end
	end

	private

	def skill_id_params
		int_array = params[:skill_id].collect{|i| i.to_i}
		Skill.pluck(:id) & int_array == int_array ? int_array : []
	end
end