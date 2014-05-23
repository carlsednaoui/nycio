require 'spec_helper'

describe Occurrence do
	before { @occurrence = create(:occurrence) }

	subject { @occurrence }

	it { should respond_to(:start_time) }

	it { should belong_to(:event) }

	it { should validate_presence_of :event_id }
	it { should validate_presence_of :start_time }
	it { should validate_presence_of :end_time }
end
