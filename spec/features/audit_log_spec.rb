require 'rails_helper'

describe "AuditLog feature" do
	
	before do
		let(:audit_log) { FactoryGirl.create(:audit_log) }
	end

	describe 'index' do
		it "can be reachd by an admin user" do
			admin_user = FactoryGirl.create(:admin_user)
			login_as(admin_user, scope: :user)
			visit audit_logs_path

			expect(page.status_code).to eq(200)
			expect(current_path).to eq(audit_logs_path)
		end

		it "can not be reached by a non-admin user" do
			user = FactoryGirl.create(:user)
			login_as(user)
			visit audit_logs_path

			expect(current_path).to eq(root_path)
		end	
	end
end