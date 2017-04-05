require 'rails_helper'

RSpec.describe PostsController, type: :controller do
	describe "index" do
		it "should get index" do
			get :index
			expect(response.status).to eq(200)
		end
	end
end
