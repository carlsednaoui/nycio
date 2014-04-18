require 'spec_helper'

describe Occurrence do
	before do 
		@occurrence = create(:occurrence)
	end

	subject { @occurrence }

	it { should respond_to(:start_time) }

	# it { should belong_to(:event) }
end
