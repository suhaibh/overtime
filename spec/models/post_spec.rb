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

    it "requires daily_hours to be present" do
      @post.daily_hours = nil
      expect(@post).to be_invalid
    end

    it 'has an daily_hours greater than 0.0' do
      @post.daily_hours = 0.0
      expect(@post).to be_invalid
    end
  end
end
