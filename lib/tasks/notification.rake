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

end
