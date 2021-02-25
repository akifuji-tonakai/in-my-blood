class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :get_away

  def show
    @tags = @user.tags
  end

  private
  def get_away
    @user = User.find(params[:id])
    current_user.id == @user.id
  end
end
