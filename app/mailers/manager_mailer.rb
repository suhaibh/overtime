class ManagerMailer < ApplicationMailer
	
	layout "mailer"

	def overtime_email manager
		@manager = manager
		mail(to: @manager.email, subject: "Daily Overtime Request Email")
	end
end
