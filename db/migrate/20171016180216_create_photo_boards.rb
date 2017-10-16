class CreatePhotoBoards < ActiveRecord::Migration[5.1]
  def change
    create_table :photo_boards do |t|
      t.integer :photo_id
      t.integer :board_id
      t.timestamps
    end
  end
end
