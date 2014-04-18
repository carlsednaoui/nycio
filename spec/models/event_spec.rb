require 'spec_helper'

describe Event do
	before do 
		@event = create(:event)
	end

	subject { @event }

	it { should respond_to(:name) }
	it { should respond_to(:description) }

	it { should belong_to(:organization) }
end
