class TagsController < ApplicationController
  def index
    @tag = current_user.tags.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save!
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
  end

  private
  def tag_params
    params.require(:tag).permit(:tag_name).merge(user_id: current_user.id)
  end

end
