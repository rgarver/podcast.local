class Podcast < ActiveRecord::Base
  has_attached_file :cover_art
  has_many :episodes
  
  def to_param
    "#{id}-#{title.downcase.gsub(/[^a-z-]+/, '-')}"
  end
end
