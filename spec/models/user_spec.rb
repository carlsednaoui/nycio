require 'spec_helper'

describe User do
	before { @user = create(:user) }
	subject { @user }

	it { should respond_to(:first_name) }
	it { should respond_to(:last_name) }
	it { should respond_to(:public) }
	it { should respond_to(:birthdate) }
	it { should respond_to(:phone) }
	it { should respond_to(:gender) }

	it { should have_many(:organizations) }
	it { should have_many(:skills) }

	it "it should have default role: volunteer" do
		@user.has_role?(:admin).should be_false
		@user.has_role?(:volunteer).should be_true
	end
end
