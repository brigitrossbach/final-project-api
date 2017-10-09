class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.integer :user_id
      t.string :url
      t.string :filter

      t.timestamps
    end
  end
end
