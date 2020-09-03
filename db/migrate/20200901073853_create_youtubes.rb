class CreateYoutubes < ActiveRecord::Migration[5.2]
  def change
    create_table :youtubes do |t|
      t.string "channel_id", null: false  
      t.text "channel_title", nullL: false 
      t.string "video_id" , null: false
      t.text "description" , null: false
      t.timestamps
    end
  end
end
