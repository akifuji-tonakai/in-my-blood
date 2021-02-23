class UrlsController < ApplicationController
  def destroy
    @url = Url.find(params[:id])
    @tag = @url.tag
    @url.destroy
    redirect_to controller: :tags, action: :show, id: @tag.id
  end
end