class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.string :name
      t.integer :room_id
      
      t.timestamps
    end
  end
end
