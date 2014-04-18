require 'spec_helper'

describe EventSkill do
	before do 
		@event_skill = create(:event_skill)
	end

	subject { @event_skill }

	it { should belong_to(:event) }
	it { should belong_to(:skill) }
end
