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
    @first_user = current_user
    @post = Post.new(post_params.merge(author: @first_user))

    if @post.save
      redirect_to user_post_path(@first_user, @post)
    else
      render :new
    end
  end

  def create_comment
    @first_user = current_user
    @post = Post.find(params[:id])
    @comment = Comment.new(comment_params.merge(post: @post, author: @first_user))

    if @comment.save
      redirect_to user_post_path(@first_user, @post)
    else
      render :new_comment
    end
  end

  def create_like
    @post = Post.find(params[:id])
    @like = Like.new(post: @post, author: current_user)

    if @like.save
      redirect_to user_post_path(current_user, @post)
    else
      render :new_comment
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
