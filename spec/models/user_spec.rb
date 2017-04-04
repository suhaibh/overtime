require 'rails_helper'

RSpec.describe User, type: :model do
  describe "creation" do
  	before do
  		@user = User.create(email: "jon@example.com", password: "password", password_confirmation: "password", 
  							first_name: "Jon", last_name: "Snow") 
  	end
  	it "can be created" do
  		expect(@user).to be_valid
  	end

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
  end
end
