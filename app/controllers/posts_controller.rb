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
    @post = Post.new
  end

  def create
    @post = Post.new(post_params.merge(author: current_user))

    if @post.save
      redirect_to user_post_path(current_user, @post)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
