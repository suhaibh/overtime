require 'rails_helper'

describe "admin homepage features" do
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
end

describe "employee homepage features" do
	before do
		@user = FactoryGirl.create(:user)
		@audit = FactoryGirl.create(:audit_log)
	end

	it "allows employees to confirm audit log from homepage" do
		@audit.update(user_id: @user.id)
		login_as(@user)

		visit root_path
		find("#audit-confirmation-link-#{@audit.id}").click
		expect(@audit.reload.status).to eq("confirmed")
	end
end