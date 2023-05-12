class LikesController < ApplicationController
  def create
    @post = Post.find(params[:id])
    @like = Like.new(post: @post, author: current_user)

    if @like.save
      redirect_to user_post_path(current_user, @post)
    else
      render :new
    end
  end
end
