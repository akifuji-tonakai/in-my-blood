class HomesController < ApplicationController
  before_action :come_in, only: :index
  def index
  end

  private
  def come_in
    if user_signed_in?
      redirect_to user_tags_path(current_user.id)
    end
  end
end
