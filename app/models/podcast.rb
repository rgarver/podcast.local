class Podcast < ActiveRecord::Base
  has_attached_file :cover_art
  has_many :episodes
end
