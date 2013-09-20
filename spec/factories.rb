FactoryGirl.define do

	factory :user do
		name "ddoyd"
		sequence(:email) {|n| "email#{n}@random.com" }
		password "ddoyd"
	end

	factory :question do
		title "What is FactoryGirl?"
		body "FactoryGirl is a thoughtbot gem that dynamically generates objects for testing.  This makes it easier to maintain tests as the code evolves over time."
		user
	end

	factory :answer do
		body "string to fill in"
		user
		question
	end

end


