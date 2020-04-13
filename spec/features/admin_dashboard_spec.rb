require 'rails_helper'

describe "admin dashboard" do 

	it "can be reached by admin user" do
		admin_user = FactoryGirl.create(:admin_user)
		login_as(admin_user)
		visit admin_root_path
		
		expect(page.status_code).to eq(200)
		expect(page.current_path).to eq(admin_root_path)
	end

	it "can't be reached by a not signed in user" do
		visit admin_root_path

		expect(page.current_path).to eq(new_user_session_path)
	end

	it "can't be reached by a regular user" do
		user = FactoryGirl.create(:user)
		login_as(user)
		visit admin_root_path

		expect(page.status_code).to eq(200)
		expect(page.current_path).to eq(root_path)
		expect(page).to have_content("Confirmation")
	end
end