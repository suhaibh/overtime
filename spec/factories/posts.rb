FactoryGirl.define do
	factory :post do
		work_performed "Sample work performed"
		date Date.today
		daily_hours 12.5
		user
	end

	factory :post_two, class: "Post" do
		work_performed "Other work performed"
		date Date.yesterday
		daily_hours 8.0
		user
	end

	factory :other_user_post, class: "Post" do
		work_performed "Another user posted this"
		date Date.today
		daily_hours 7.0
	end
end