require 'spec_helper'

describe UserOrganization do
	before {@user_organization = create(:user_organization)}
	subject { @user_organization }

	it { should belong_to(:user) }
	it { should belong_to(:organization) }
end
