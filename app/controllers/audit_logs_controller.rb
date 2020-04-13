class AuditLogsController < ApplicationController
	def index
		if authorize AuditLog
			@audit_logs = AuditLog.page params[:page]
		end
	end

	def confirm
		@audit_log = AuditLog.find(params[:id])
		authorize @audit_log
		@audit_log.confirmed!
		redirect_to root_path, notice: "Audit confirmed for week of: #{@audit_log.start_date}"
	end

	private

		def user_not_authorized
		  flash[:alert] = "You are not authorized to perform this action."
		  redirect_to root_path
		end
end
