require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "creation" do
  	before do 
  		@post = FactoryGirl.create(:post)
  	end

  	it "can be created" do
      expect(@post).to be_valid
  	end

  	it "requires rationale to be present" do
  		@post.rationale = ""
  		expect(@post).to be_invalid
  	end

  	it "requires date to be present" do
  		@post.date = ""
  		expect(@post).to be_invalid
  	end
  end
end
