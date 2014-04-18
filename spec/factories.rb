FactoryGirl.define do
	factory :event do
		sequence(:name) { |n| "name #{n}" }
		sequence(:description) { |n| "description #{n}" }
		organization
	end

	factory :occurrence do
		event
	end

	factory :organization do
		sequence(:name) { |n| "name #{n}" }
		sequence(:description) { |n| "description #{n}" }
	end

	factory :skill do

	end
end