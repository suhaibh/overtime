require 'rails_helper'

RSpec.describe AuditLog, type: :model do
  
  before do
  	@audit_log = FactoryGirl.create(:audit_log)
  end

  describe "creation" do
  	it "can be created" do
  		expect(@audit_log).to be_valid
  	end
  end

  describe "validations" do
  	it "should require status and default to 0" do
  		@audit_log.status = nil
  		expect(@audit_log).to be_invalid
  	end

  	it "should require a user association" do
  		@audit_log.user_id = nil
  		expect(@audit_log).to be_invalid
  	end

  	it "should require a start date" do
  		@audit_log.start_date = nil
  		expect(@audit_log).to be_invalid
  	end

  	it "should have a start date equal to six days prior" do
  		new_audit_log = AuditLog.create(user_id: User.last.id)
  		expect(new_audit_log.start_date).to eq(Date.today - 6.days)
  	end
  end
end
