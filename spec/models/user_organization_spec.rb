require 'spec_helper'

describe UserOrganization do
	before do 
		@user_organization = create(:user_organization)
	end

	subject { @user_organization }

	it { should belong_to(:user) }
	it { should belong_to(:organization) }
end
