class Episode < ActiveRecord::Base
  has_attached_file :media
  before_create :generate_guid
  
  belongs_to :podcast
  
  def media_duration
    Mp3Info.open(self.media.path) do |mp3|
      self.media_duration = mp3.length.to_i
    end
  end
  
  
  private
  
  def generate_guid
    self[:guid] = UUID.generate
  end
end
