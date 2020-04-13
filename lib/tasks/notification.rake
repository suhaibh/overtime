namespace :notification do
  desc "Sends SMS notification to employees asking them to log if they had overtime or not"
  task sms: :environment do
  	# 1. Schedule to run every Sunday at 5:00pm, will use something on Heroku to do that
  	# 2. Iterate over list of all employees
  	# 3. Skip AdminUsers
  	# 4. Send a message with instructions and a link to log time
  	# Users.all.each do |user|
  	#	Sms.send_sms(number: user.number, )
  	#end
  end

  desc "Send mail notifaction to managers each day to inform pending overtime requests"
  task manager_email: :environment do 
    # 1. iterate over list of pending overtime requests
    # 2. check to see if there are any requests
    # 3. iterate over list of AdminUsers
    # 4. send email to each admin
    submitted_posts = Post.submitted
    admin_users = AdminUser.all

    if submitted_posts.count > 0
      admin_users.each do |admin_user|
        ManagerMailer.overtime_email(admin_user).deliver_later
      end
    end
  end

end
