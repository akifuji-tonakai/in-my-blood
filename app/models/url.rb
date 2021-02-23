class Url < ApplicationRecord
  belongs_to :tag

  validates :youtubepath, presence: true, if: :change
  
  def change
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
  end
  
end
