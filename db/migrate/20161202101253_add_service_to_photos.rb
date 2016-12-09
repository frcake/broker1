class AddServiceToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_reference :photos, :service, foreign_key: true
  end
end
