require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /posts" do
    it "returns a 200" do
      get posts_path
      expect(response).to have_http_status(200)
    end

    it "returns all posts when under 10 posts" do
      post = FactoryBot.create(:post)
      get posts_path
      expect(response.body).to include(post.to_json)
    end

    it "will return at most 10 posts" do
      12.times do
        FactoryBot.create :post
      end
      get posts_path
      expect(JSON.parse(response.body).length).to eq(10)
    end

    it 'will return pages of size 10' do
      12.times do
        FactoryBot.create :post
      end
      get posts_path, params: {page: 2}
      expect(JSON.parse(response.body).length).to eq(2)
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

    it 'allows for tags to be added' do
      post posts_path, params: { post: @post_attrs.merge(tag_list: 'test, code, thing') }, headers: @headers
      obj = JSON.parse(response.body)
      expect(obj['tag_list']).to eql(%w(test code thing))
    end

  end

end
