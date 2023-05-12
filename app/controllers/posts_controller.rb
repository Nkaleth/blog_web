class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params['user_id'])
  end

  def show
    @post = Post.find_by(id: params[:id], author_id: params[:user_id])
    @user = User.find_by(id: params['user_id'])
  end

  def new
    pp 'NEW FOR CREATING NEW POST'
  end
end
