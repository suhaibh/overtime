# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
@user = User.create(email: "luke@example.com", password: "password", password_confirmation: "password",
					first_name: "Luke", last_name: "Skywalker")

puts "User created"

@admin_user = AdminUser.create(email: "admin@example.com", password: "password", password_confirmation: "password",
								first_name: "Admin", last_name: "User")

puts "Admin User Created"

50.times do |post|
	Post.create(date: Date.today, rationale: "#{post + 1} rationale", user_id: @user.id)
end

puts "100 posts created"