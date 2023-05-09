class UsersController < ApplicationController
  def index
    puts 'Simple action for Index'
  end

  def show
    @user = User.find_by(id: params[:id])
  end
end
