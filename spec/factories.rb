FactoryGirl.define do
	factory :event do
		sequence(:name) { |n| "name #{n}" }
		sequence(:description) { |n| "description #{n}" }
		organization
	end

	factory :event_skill do
		event
		skill
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

	factory :user do
    sequence(:first_name) { |n| "first_name#{n}" }
    sequence(:last_name) { |n| "first_name#{n}" }
    phone "123456789"
    birthdate { 50.years.ago }
    gender "male"
		sequence(:email) { |n| "person_#{n}@example.com" }
		password 			  'testingnycio'
		password_confirmation 'testingnycio'
	end

	factory :user_organization do
		user
		organization
	end

	factory :user_skill do
		user
		skill
	end
end
