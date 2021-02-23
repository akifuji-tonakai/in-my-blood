class TagsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @tags = @user.tags
  end

  def new
    @user = User.find(params[:user_id])
    @tag_url = TagUrl.new
  end

  def create
    @tag_url = TagUrl.new(tag_url_params)
    if @tag_url.valid?
      @tag_url.saved
      delete_nill_url
      redirect_to action: :index
    else
      @user = User.find(params[:user_id])
      render :new
    end
  end

  def show
    @tag = Tag.find(params[:id])
    @urls = @tag.urls
    @user = User.find(params[:user_id])
    @tags = @user.tags
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to action: :index
  end

  private
  def tag_url_params
    params.require(:tag_url).permit(:tag_name, youtubepaths:[]).merge(user_id: current_user.id)
  end
  def delete_nill_url
    @falses = Url.where(youtubepath: "false")
    @falses.destroy_all
  end

end
