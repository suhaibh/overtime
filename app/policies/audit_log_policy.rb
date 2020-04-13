class AuditLogPolicy < ApplicationPolicy
	def index?
		return true if admin_types.include?(user.type)
	end

	def confirm?
		return true if user_or_admin
	end

	private
		def user_or_admin
			record.user_id == user.id || admin?
		end
end