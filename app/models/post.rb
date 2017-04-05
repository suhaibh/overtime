class Post < ActiveRecord::Base
	validates :rationale, presence: true
	validates :date, presence: true
end
