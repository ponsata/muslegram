class CreateYoutubes < ActiveRecord::Migration[5.2]
  def change
    create_table :youtubes do |t|
      t.string :channel_id     , null: false  
      t.string :channel_title  , null: false 
      t.string :title          , null: false    
      t.string :video_id       , null: false
      t.text :description      , null: false
      t.timestamps
    end
  end
end
