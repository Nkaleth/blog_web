class PostsController < ApplicationController
  def index
    puts 'Simple action for Index'
  end

  def show
    @post = Post.find_by(id: params[:id])
  end
end
