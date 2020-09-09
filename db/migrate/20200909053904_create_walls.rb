class CreateWalls < ActiveRecord::Migration[6.0]
  def change
    create_table :walls do |t|
      t.string :name
      t.integer :room_id
      
      t.timestamps
    end
  end
end
