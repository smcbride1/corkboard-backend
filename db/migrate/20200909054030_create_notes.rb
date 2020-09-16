class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string :title
      t.string :short_content
      t.string :long_content
      t.integer :x_offset
      t.integer :y_offset
      t.belongs_to :board
      
      t.timestamps
    end
  end
end
