class CreatePodcasts < ActiveRecord::Migration
  def self.up
    create_table :podcasts do |t|
      t.string :title
      t.text :description
      t.string :language
      t.string :author
      t.text :subtitle
      t.text :summary
      t.string :owner_name, :owner_email
      t.boolean :explicit
      t.string :cover_art_file_name, :cover_art_content_type
      t.integer :cover_art_file_size
      t.datetime :cover_art_updated_at
      t.text :categories
      t.timestamps
    end
  end

  def self.down
    drop_table :podcasts
  end
end
