class UrlsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_away
  def new
    @tag = Tag.find(params[:tag_id])
    @url = Url.new
  end
  def create
    @tag = Tag.find(params[:tag_id])
    @url = Url.new(url_params)
    if @url.save
      delete_nill_url
      redirect_to action: :new
    else
      render :new
    end
    
  end
  def destroy
    @url = Url.find(params[:tag_id])
    @tag = Tag.find(params[:id])
    @url.destroy
    redirect_to controller: :tags, action: :show, id: @tag.id
  end

  private
  def url_params
    params.require(:url).permit(:youtubepath).merge(tag_id: params[:tag_id])
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