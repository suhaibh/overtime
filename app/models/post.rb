class Post < ActiveRecord::Base
	belongs_to :user
	enum status: {submitted: 0, approved: 1, rejected: 2}

	validates :rationale, presence: true
	validates :date, presence: true
	validates :overtime_request, presence: true
	validates :overtime_request, numericality: { greater_than: 0.0 }

	scope :posts_by, ->(user) {where(user_id: user.id) }

	paginates_per 10

end
