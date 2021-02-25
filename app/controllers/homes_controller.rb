class HomesController < ApplicationController
  before_action :come_in, only: :index
  def index
  end

  private
  def come_in
    if user_signed_in?
      if current_user.tags.exists?
      redirect_to user_tags_path(current_user.id)
      else
        redirect_to user_path(current_user.id)
      end
    end
  end
end
