require 'spec_helper'

describe Occurrence do
	before { @occurrence = create(:occurrence) }

	subject { @occurrence }

	it { should respond_to(:start_time) }

	it { should belong_to(:event) }
end
