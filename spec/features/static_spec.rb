require 'rails_helper'

describe 'navigate' do
  before do
  	user = User.create(email: "jon@example.com", password: "password", password_confirmation: "password",
  						first_name: "Jon", last_name: "Snow")
  	login_as(user, scope: :user)
  end
  describe 'homepage' do
    it 'can be reached successfully' do
      visit root_path
      expect(page).to have_content("Homepage")
    end
  end
end