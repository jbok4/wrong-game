class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.integer :game_id
      t.string :img
      t.string :caption

      t.timestamps
    end
  end
end
