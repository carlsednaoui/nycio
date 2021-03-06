require 'spec_helper'

describe Organization do
	before { @organization = create(:organization) }
	subject { @organization }

	it { should respond_to(:name) }
	it { should respond_to(:description) }

	it { should have_many(:events) }
	it { should have_many(:users).through :user_organizations }

	it { should validate_presence_of :name }
	it { should validate_presence_of :description }
end
