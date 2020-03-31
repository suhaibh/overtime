FactoryGirl.define do
	factory :post do
		rationale "Sample rationale"
		date Date.today
		overtime_request 3.5
		user
	end

	factory :post_two, class: "Post" do
		rationale "Other rationale"
		date Date.yesterday
		overtime_request 0.5
		user
	end

	factory :other_user_post, class: "Post" do
		rationale "Another user posted this"
		date Date.today
		overtime_request 1.5
	end
end