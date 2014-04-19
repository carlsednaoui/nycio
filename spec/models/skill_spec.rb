require 'spec_helper'

describe Skill do
	before { @skill = create(:skill) }
	subject { @skill }

	it { should respond_to(:name) }

	it { should have_many(:users) }
	it { should have_many(:events) }
end
