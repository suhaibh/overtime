class Post < ActiveRecord::Base
	belongs_to :user
	enum status: {submitted: 0, approved: 1, rejected: 2}

	validates :rationale, presence: true
	validates :date, presence: true
	validates :overtime_request, presence: true
	validates :overtime_request, numericality: { greater_than: 0.0 }

	scope :posts_by, ->(user) {where(user_id: user.id) }

	paginates_per 10

	after_save :update_audit_log

	private
		def update_audit_log
			audit_log = AuditLog.where(user_id: self.user_id, start_date: (self.date - 7.days..self.date)).last
			if audit_log
				audit_log.confirmed!
			end
		end

end
