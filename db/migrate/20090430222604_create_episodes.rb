class CreateEpisodes < ActiveRecord::Migration
  def self.up
    create_table :episodes do |t|
      t.string :title
      t.integer :podcast_id
      t.string :link
      t.string :guid
      t.text :description
      t.string :media_file_name, :media_content_type
      t.integer :media_file_size, :media_duration
      t.datetime :media_updated_at
      t.string :author
      t.text :subtitle, :summary
      t.text :keywords
      t.timestamps
    end
  end

  def self.down
    drop_table :episodes
  end
end
