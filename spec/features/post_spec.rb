require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    
    it 'can be reached successfully' do
    	visit posts_path
    	expect(page.status_code).to eq(200)
    	expect(page).to have_content("Posts Index")
    end

    it 'displays created posts' do
    	post = Post.create(rationale: "sample rationale", date: Date.today)
    	visit posts_path
    	expect(page).to have_content("sample rationale")
    end

  end

  describe "posts creation" do
  	it "has a form that can be reached" do
  		visit new_post_path
  		expect(page.status_code).to eq(200)
  		expect(page).to have_selector('form')
  	end

  	it "can create a post through form" do
  		visit new_post_path
  		fill_in "post[rationale]", with: "sample rationale"
  		fill_in "post[date]", with: Date.today
  		click_button "Save"
  		expect(current_path).to_not eq posts_path
  		expect(page).to have_content("sample rationale")
  	end

  	it "renders new if rationale is blank" do
  		visit new_post_path
  		fill_in "post[date]", with: Date.today
  		click_button "Save"
  		expect(page).to have_selector('form')
  	end

  	it "renders new if date is blank" do
  		visit new_post_path
  		fill_in "post[rationale]", with: "sample rationale"
  		click_button "Save"
  		expect(page).to have_selector('form')
  	end
  end
end