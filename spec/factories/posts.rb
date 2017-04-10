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
end