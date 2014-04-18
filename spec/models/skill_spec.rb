require 'spec_helper'

describe Skill do
	before do 
		@skill = create(:skill)
	end

	subject { @skill }

	it { should respond_to(:name) }
end
