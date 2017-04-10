class Post < ActiveRecord::Base
	belongs_to :user

	validates :rationale, presence: true
	validates :date, presence: true

	
end
