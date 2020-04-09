FactoryGirl.define do
	sequence :email do |n|
		"test#{n}@example.com"
	end

	factory :user do
		email 					{ generate :email }
		password 				"password"
		password_confirmation 	"password"
		first_name				"Jon"
		last_name				"Snow"
		phone					"5555555555"
	end

	factory :admin_user, class: "AdminUser" do
		email 					{ generate :email }
		password 				"password"
		password_confirmation 	"password"
		first_name 				"Admin"
		last_name 				"User"
		phone					"5555555555"
	end

	factory :second_user, class: "User" do
		email					{ generate :email }
		password 				"password"
		password_confirmation 	"password"
		first_name				"Ned"
		last_name				"Stark"
		phone					"5555555555"
	end
end