class UrlsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @tag = Tag.find(params[:tag_id])
    @url = Url.new
  end
  def create
    @user = User.find(params[:user_id])
    @tag = Tag.find(params[:tag_id])
    @url = Url.new(url_params)
    if @url.save
      redirect_to action: :new
      delete_nill_url
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
 
end