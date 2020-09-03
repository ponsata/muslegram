class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :title,         null:false
      t.text :explanation,     null:false
    
      t.references :youtube,   null: false, foreign_key: true
      t.timestamps
    end
  end
end
