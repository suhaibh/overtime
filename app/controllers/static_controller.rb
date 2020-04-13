class StaticController < ApplicationController
  def homepage
  	if admin_types.include?(current_user.try(:type))
  		@pending_approvals = Post.where(status: "submitted")
  	end
  end

  private
  	
  	def admin_types
  		["AdminUser"]
  	end

end
