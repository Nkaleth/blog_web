class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params['user_id'])
  end

  def show
    @post = Post.find_by(id: params[:id], author_id: params[:user_id])
    @user = User.find_by(id: params['user_id'])
  end

  def new
    @first_user = current_user
    @posts = Post.new
  end
end
