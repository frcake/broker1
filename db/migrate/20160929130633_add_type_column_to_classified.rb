class AddTypeColumnToClassified < ActiveRecord::Migration[5.0]
  def change
    add_column :classifieds , :giveaway , :boolean , :default => false
    add_column :classifieds , :trade , :boolean , :default => false
    add_column :classifieds , :sell , :boolean , :default => true
  end
end
