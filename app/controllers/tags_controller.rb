class TagsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :get_away, except: [:index, :show]
  def index
    @user = User.find(params[:user_id])
    @tags = @user.tags
    @urls = Url.all.where(tag_id: @tags.ids)
  end

  def new
    @tag_url = TagUrl.new
  end

  def create
    @tag_url = TagUrl.new(tag_url_params)
    if @tag_url.valid?
      @tag_url.saved
      delete_nill_url
      redirect_to action: :index
    else
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
    redirect_to controller: :users, action: :show, id: params[:user_id]
  end

  private
  def tag_url_params
    params.require(:tag_url).permit(:tag_name, youtubepaths:[]).merge(user_id: current_user.id)
  end
  def delete_nill_url
    @falses = Url.where(youtubepath: "false")
    @falses.destroy_all
  end
  def get_away
    @user = User.find(params[:user_id])
    unless current_user.id == @user.id
      redirect_to root_path
    end
  end

end
