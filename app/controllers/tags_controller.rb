class TagsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @tag = @user.tags
  end

  def new
    @user = User.find(params[:user_id])
    @tag_url = TagUrl.new
  end

  def create
    @tag_url = TagUrl.new(tag_url_params)
    if @tag_url.valid?
      @tag_url.saved
      redirect_to action: :index
    else
      @user = User.find(params[:user_id])
      render :new
    end
  end

  def show
    binding.pry
    @tag = Tag.find(params[:id])
    @urls = @tag.urls
  end

  private
  def tag_url_params
    params.require(:tag_url).permit(:tag_name, youtubepaths:[]).merge(user_id: current_user.id)
  end

end
