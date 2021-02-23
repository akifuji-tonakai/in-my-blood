class TagUrl
  include ActiveModel::Model
  attr_accessor :tag_name, :youtubepaths, :user_id

  def saved
    tag = Tag.create(tag_name: tag_name, user_id: user_id)

    youtubepaths.each do |youtubepath|
      if youtubepath.include?("watch?v=")
        youtubepath.gsub!("watch?v=", "embed/")
      elsif youtubepath.include?("youtu.be")
        youtubepath.gsub!("youtu.be", "youtube.com/embed")
      elsif youtubepath.include?("playlist?")
        youtubepath.gsub!("playlist","embed/videoseries")
      end
      Url.create(youtubepath: youtubepath, tag_id: tag.id)
    end
  end
end