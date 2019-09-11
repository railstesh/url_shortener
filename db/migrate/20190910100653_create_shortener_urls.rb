class CreateShortenerUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :shortener_urls do |t|
      t.text :url, null: false, length: 2083
      t.string :unique_key, limit: 10, null: false
      t.integer :use_count, null: false, default: 0
      t.text :title
      t.timestamps
    end
  end
end
