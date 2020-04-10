class AuditLog < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id, :status, :start_date
  enum status: {pending: 0, completed: 1}

  after_initialize :set_defaults

  private
  	def set_defaults
  		self.start_date ||= (Date.today - 6.days)
  	end
end
