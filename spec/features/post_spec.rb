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
end