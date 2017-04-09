require 'rails_helper'

describe 'navigate' do
  before do
  	@user = User.create(email: "jon@example.com", password: "password", password_confirmation: "password",
  						first_name: "Jon", last_name: "Snow")
  	login_as(@user, scope: :user)
    visit posts_path
  end
  describe 'index' do
    
    it 'can be reached successfully' do
    	expect(page.status_code).to eq(200)
    	expect(page).to have_content("Posts Index")
    end

    it 'displays created posts' do
    	post = Post.create(rationale: "sample rationale", date: Date.today, user_id: @user.id)
    	visit posts_path
    	expect(page).to have_content("sample rationale")
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