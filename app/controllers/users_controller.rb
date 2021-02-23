class UsersController < ApplicationController
  def show
    redirect_to controller: :tags, action: :index
end
