FactoryGirl.define do
	factory :post do
		rationale "Sample rationale"
		date Date.today
		daily_hours 12.5
		user
	end

	factory :post_two, class: "Post" do
		rationale "Other rationale"
		date Date.yesterday
		daily_hours 8.0
		user
	end

	factory :other_user_post, class: "Post" do
		rationale "Another user posted this"
		date Date.today
		daily_hours 7.0
	end
end