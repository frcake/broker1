class AddTitleToCategories < ActiveRecord::Migration[5.0]
  def change
  	add_column :Categories , :title , :string
  end
end
