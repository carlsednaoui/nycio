require 'spec_helper'

describe Organization do
	before do 
		@organization = create(:organization)
	end

	subject { @organization }

	it { should respond_to(:name) }
	it { should respond_to(:description) }

	it { should have_many(:events) }
end
