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

    it "requires overtime_request to be present" do
      @post.overtime_request = nil
      expect(@post).to be_invalid
    end

    it 'has an overtime_request greater than 0.0' do
      @post.overtime_request = 0.0
      expect(@post).to be_invalid
    end
  end
end
