require 'rails_helper'

describe 'navigate' do
  before do
  	user = FactoryGirl.create(:user)
  	login_as(user, scope: :user)
  end
  describe 'homepage' do
    it 'can be reached successfully' do
      visit root_path
      expect(page).to have_content("Confirmation")
    end
  end
end