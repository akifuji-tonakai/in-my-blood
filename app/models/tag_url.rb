class TagUrl
  include ActiveModel::Model
  attr_accessor :tag_name, :youtubepaths, :user_id

  def saved
    tag = Tag.create(tag_name: tag_name, user_id: user_id)
    youtubepaths.each do |youtubepath|
    Url.create(youtubepath: youtubepath, tag_id: tag.id)
    end
  end
end