class PostsController < ApplicationController
  def index
    render json: Post.all
  end

  def create
    @post = Post.new
    if @post.update(allowed_params)
      render json: @post
    else
      render json: @post.errors.to_json
    end
  end

  private

  def allowed_params
    params.require(:post).permit(:title, :body)
  end
end

