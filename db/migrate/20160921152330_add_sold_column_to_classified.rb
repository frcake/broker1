class AddSoldColumnToClassified < ActiveRecord::Migration[5.0]
  def change
  	add_column :classifieds , :sold , :boolean , :default => false
  end
end
