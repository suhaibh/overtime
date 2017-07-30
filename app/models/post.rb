class Post < ActiveRecord::Base
	belongs_to :user
	enum status: {submitted: 0, approved: 1, rejected: 2}

	validates :rationale, presence: true
	validates :date, presence: true

	scope :posts_by, ->(user) {where(user_id: user.id) }
end
