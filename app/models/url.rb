class Url < ApplicationRecord
  belongs_to :tag

  validates :youtubepath, presence: true, if: :change
  
  def change
    if youtubepath.slice(0..12) == "https://youtu" || youtubepath.slice(0..22) == "https://www.youtube.com"
      if youtubepath.include?("watch?v=")
        youtubepath.slice!("www.")
        if youtubepath.include?("&list")
          youtubepath.sub!(/&list.*/m,"")
        end
        if  youtubepath.include?("&feature=emb_title")
          youtubepath.slice!("&feature=emb_title")
        end
        youtubepath.gsub!("watch?v=", "embed/")
      elsif youtubepath.include?("youtu.be")
        youtubepath.gsub!("youtu.be", "youtube.com/embed")
      elsif youtubepath.include?("playlist?")
        youtubepath.gsub!("playlist","embed/videoseries")
      end
      elsif youtubepath.include?("")
        youtubepath.gsub!(youtubepath,"false")
      else
       youtubepath.gsub!(youtubepath,"false")
     end
  end
  
end