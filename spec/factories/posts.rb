FactoryGirl.define do
	factory :post do
		rationale "Sample rationale"
		date Date.today
		user
	end

	factory :post_two, class: "Post" do
		rationale "Other rationale"
		date Date.yesterday
		user
	end

	factory :other_user_post, class: "Post" do
		rationale "Another user posted this"
		date Date.today
	end
end