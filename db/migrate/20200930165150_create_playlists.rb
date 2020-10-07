class CreatePlaylists < ActiveRecord::Migration[5.2]
  def change
    create_table :playlists do |t|
      t.references :user, foregin_key: true, null: false
      t.references :youtube,  foregin_key: true, null: false

      t.timestamps

      t.index [:user_id, :youtube_id],unique: true 
    end
  end
end