class TagUrl
  include ActiveModel::Model
  attr_accessor :tag_name, :youtubepaths, :user_id

  with_options presence: true do
   validates :tag_name, presence: true
  end

  def saved
    tag = Tag.create(tag_name: tag_name, user_id: user_id)
    youtubepaths.each do |youtubepath|
      if youtubepath.slice(0..12) == "https://youtu" || youtubepath.slice(0..22) == "https://www.youtube.com"
       if youtubepath.include?("watch?v=")
         youtubepath.gsub!("watch?v=", "embed/")
       elsif youtubepath.include?("youtu.be")
         youtubepath.gsub!("youtu.be", "youtube.com/embed")
       elsif youtubepath.include?("playlist?")
         youtubepath.gsub!("playlist","embed/videoseries")
       end
      else
        youtubepath.gsub!(youtubepath,"false")
      end
      Url.create(youtubepath: youtubepath, tag_id: tag.id)
    end
  end


end