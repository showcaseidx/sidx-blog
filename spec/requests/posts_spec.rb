require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /posts" do
    it "returns a 200" do
      get posts_path
      expect(response).to have_http_status(200)
    end

    it "returns all posts" do
      post = FactoryBot.create(:post)
      get posts_path
      expect(response.body).to include(post.to_json)
    end
  end
end
