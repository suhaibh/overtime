class Post < ActiveRecord::Base
	validates :rationale, presence: true
	validates :date, presence: true

	belongs_to :user
end
