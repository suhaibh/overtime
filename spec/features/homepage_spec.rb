require 'rails_helper'

describe "Homepage features" do
	before do
		@post = FactoryGirl.create(:post)
	end

	it "allows an admin to approve overtime from homepage" do
		admin_user = FactoryGirl.create(:admin_user)
		login_as(admin_user)
		
		visit(root_path)
		find("#approval-link-#{@post.id}").click
		expect(@post.reload.status).to eq("approved")
	end

	xit "does not allow regular users to approve overtime" do
		user = FactoryGirl.create(:user)
		login_as(user)

		put :approve, id: @post.id
		expect(@post.reload.status).to eq("submitted")
	end
end