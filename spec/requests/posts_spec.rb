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

  describe "POST /posts" do
    before :each do
      @post_attrs = FactoryBot.attributes_for(:post)
      @headers = { "HTTP_ACCEPT" => "application/json" }
    end

    it 'create a post when posting' do
      post posts_path, params: { post: @post_attrs }, headers: @headers
      expect(Post.count).to eq(1)
    end

    it 'return 200 on success' do
      post posts_path, params: { post: @post_attrs }, headers: @headers
      expect(response).to have_http_status(200)
    end

    it 'returns the post attribs on successful post' do
      post posts_path, params: { post: @post_attrs }, headers: @headers
      obj = JSON.parse(response.body)
      expect(obj['id']).to_not eq(nil)
      expect(obj['title']).to eq(Post.first.title)
    end

    xit 'returns errors on failed validations' do
      pending 'There are no current validations'
    end


  end

end
