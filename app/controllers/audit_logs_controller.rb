class AuditLogsController < ApplicationController
	def index
		if authorize AuditLog
			@audit_logs = AuditLog.page params[:page]
		end
	end

	private

		def user_not_authorized
		  flash[:alert] = "You are not authorized to perform this action."
		  redirect_to root_path
		end
end
