class AddTitleToService < ActiveRecord::Migration[5.0]
  def change
    add_column :services, :title, :string
  end
end
