require 'spec_helper'

describe UserSkill do
	before do 
		@user_skill = create(:user_skill)
	end

	subject { @user_skill }

	it { should belong_to(:user) }
	it { should belong_to(:skill) }
end
