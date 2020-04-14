require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryGirl.create(:user) 
  end

  describe "creation" do
    
  	it "can be created" do
  		expect(@user).to be_valid
  	end
  end

  describe "validations" do
  	it "should require email" do
  		@user.email = ""
  		expect(@user).to be_invalid
  	end

  	it "should require password" do
  		@user.password = ""
  		expect(@user).to be_invalid
  	end
  	it "should require matching passwords" do
  		@user.password = ""
  		@user.password_confirmation = "notpassword"
  		expect(@user).to be_invalid
  	end

  	it "should require first name" do
  		@user.first_name = ""
  		expect(@user).to be_invalid
  	end

  	it "should requiire last name" do
  		@user.last_name = ""
  		expect(@user).to be_invalid
  	end

    it "should require phone" do
      @user.phone = nil
      expect(@user).to be_invalid
    end

    it "should require phone to be exactly 10 characters long" do
      @user.phone = "5" * 11
      expect(@user).to be_invalid
    end

    it "should require phone number to be formatted propertly" do
      @user.phone = "55-55a5c 5"
      expect(@user).to be_invalid
    end
  end

  describe "relationship between admins and employees" do
    it "allows for admins to be associated with multiple employees" do
      employee_1 = FactoryGirl.create(:user)
      employee_2 = FactoryGirl.create(:second_user)
      admin = FactoryGirl.create(:admin_user)
      Hand.create!(user_id: admin.id, hand_id: employee_1.id)
      Hand.create!(user_id: admin.id, hand_id: employee_2.id)
      expect(admin.hands.count).to eq(2)
    end
  end
end
