class AddPublicToPhotos < ActiveRecord::Migration[5.1]
  def change
    add_column :photos, :public, :boolean, default: true
  end
end
