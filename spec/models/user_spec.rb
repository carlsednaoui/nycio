require 'spec_helper'

describe User do
	before do 
		@user = create(:user)
	end

	subject { @user }

	it { should respond_to(:name) }
	it { should respond_to(:public) }
	it { should respond_to(:birthdate) }
	it { should respond_to(:admin) }

	it { should have_many(:organizations) }
end
