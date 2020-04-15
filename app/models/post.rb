class Post < ActiveRecord::Base
	belongs_to :user
	enum status: {submitted: 0, approved: 1, rejected: 2}

	validates :work_performed, presence: true
	validates :date, presence: true
	validates :daily_hours, presence: true
	validates :daily_hours, numericality: { greater_than: 0.0 }

	scope :posts_by, ->(user) {where(user_id: user.id) }

	paginates_per 10

	after_save :confirm_audit_log, if: :approved?
	after_save :unconfirm_audit_log, if: :rejected?

	private
		def confirm_audit_log
			audit_log = AuditLog.where(user_id: self.user_id, start_date: (self.date - 7.days..self.date)).last
			if audit_log
				audit_log.confirmed!
			end
		end

		def unconfirm_audit_log
			audit_log = AuditLog.where(user_id: self.user_id, start_date: (self.date - 7.days..self.date)).last
			if audit_log
				audit_log.pending!
				audit_log.update(end_date: "")
			end
		end

end
