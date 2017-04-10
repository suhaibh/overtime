require 'rails_helper'

describe 'navigate' do
  before do
  	@user = FactoryGirl.create(:user)
  	login_as(@user, scope: :user)
  end
 
 describe 'index' do
    before do
      visit posts_path
    end
    
    it 'can be reached successfully' do
    	expect(page.status_code).to eq(200)
    	expect(page).to have_content("Posts Index")
    end

    it 'displays created posts' do
      post1 = FactoryGirl.create(:post)
      post2 = FactoryGirl.create(:post_two)
      visit posts_path
      expect(page).to have_content(/Sample|Other/)
    end

  end

  describe "posts creation" do
  	before do
  		visit new_post_path
  	end

  	it "has a form that can be reached" do
  		expect(page.status_code).to eq(200)
  		expect(page).to have_selector('form')
  	end

  	it "can create a post through form" do
  		fill_in "post[rationale]", with: "sample rationale"
  		fill_in "post[date]", with: Date.today
  		click_button "Save"
  		expect(current_path).to_not eq posts_path
  		expect(page).to have_content("sample rationale")
  	end

  	it "will have a user associated with it" do
  		fill_in "post[rationale]", with: "User associated"
  		fill_in "post[date]", with: Date.today
  		click_button "Save"

  		expect(User.last.posts.last.rationale).to eq("User associated")
  	end

  	it "renders new if rationale is blank" do
  		fill_in "post[date]", with: Date.today
  		click_button "Save"
  		expect(page).to have_selector('form')
  	end

  	it "renders new if date is blank" do
  		fill_in "post[rationale]", with: "sample rationale"
  		click_button "Save"
  		expect(page).to have_selector('form')
  	end
  end
end