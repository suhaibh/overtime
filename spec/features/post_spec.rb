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
      post1.update(user_id: @user.id)
      post2 = FactoryGirl.create(:post_two)
      post2.update(user_id: @user.id)
      visit posts_path
      expect(page).to have_content(/Sample|Other/)
    end

    it 'only lets users see their own posts' do
      post1 = Post.create(rationale: "post1 rationale", date: Date.today, user_id: @user.id)
      post2 = Post.create(rationale: "post2 rationale", date: Date.today, user_id: @user.id)
      other_user = FactoryGirl.create(:second_user)
      other_user_post = Post.create(rationale: "Another user posted this", date: Date.today, user_id: other_user.id)
      visit posts_path

      expect(page).to_not have_content("Another user posted this")
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

  describe "edit posts" do
    before do
      @edit_user = User.create(first_name: "Edit", last_name: "User", email: "edituser@example.com",
                                password: "password", password_confirmation: "password")
      login_as(@edit_user, scope: :user)
      @edit_post = Post.create(date: Date.today, rationale: "Some rationale", user_id: @edit_user.id)
    end

    it "can update the post" do
      visit edit_post_path(@edit_post)

      fill_in "post[rationale]", with: "Updated post"
      fill_in "post[date]", with: Date.yesterday
      click_button "Save"

      expect(page).to have_content(/Updated post|#{Date.yesterday}/)
    end

    it "should have rationale present" do
      visit edit_post_path(@edit_post)

      fill_in "post[rationale]", with: ""
      fill_in "post[date]", with: Date.yesterday
      click_button "Save"

      expect(page).to have_selector('form')
    end

    it "cannot be edited by a non-authorized user" do
      logout(:user)
      user = FactoryGirl.create(:second_user)
      login_as(user, scope: :user)

      visit edit_post_path(@edit_post)
      expect(current_path).to eq(posts_path)
    end
  end
  
  describe 'delete posts' do
    before do
      @post = FactoryGirl.create(:post)
      @post.update(user_id: @user.id)
    end

    it "should delete post from index" do
      visit posts_path

      expect {
        click_link("delete-post-#{@post.id}")
      }.to change(Post, :count).by(-1)
      
      expect(current_path).to eq(posts_path)
    end
  end

end