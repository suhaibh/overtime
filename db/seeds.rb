@employee = Employee.create(email: "luke@example.com", 
														password: "password", 
														password_confirmation: "password",
														first_name: "Luke", 
														last_name: "Skywalker",
														phone: "9175846721",
														ssn: 1234,
														company: "Acme Corp")

puts "User created"

@admin_user = AdminUser.create(email: "admin@example.com", 
																password: "password", 
																password_confirmation: "password",
																first_name: "Admin", 
																last_name: "User",
																phone: "9175846721",
																ssn: 1234,
																company: "Acme Corp")

puts "Admin User Created"

AuditLog.create!(user_id: @employee.id, status: 0, start_date: (Date.today - 6.days))
AuditLog.create!(user_id: @employee.id, status: 0, start_date: (1.week.ago - 6.days))
AuditLog.create!(user_id: @employee.id, status: 0, start_date: (2.weeks.ago - 6.days))

50.times do |post|
	Post.create(date: Date.today, rationale: "#{post + 1} rationale content. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.", user_id: @employee.id, overtime_request: 2.5)
end

puts "100 posts created"

