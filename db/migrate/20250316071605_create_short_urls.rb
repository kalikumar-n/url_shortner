class CreateShortUrls < ActiveRecord::Migration[8.0]
  def change
    create_table :short_urls do |t|
      t.string :original_url, null: false
      t.string :short_code, null: false

      t.timestamps
    end

    add_index :short_urls, :short_code, unique: true
  end
end