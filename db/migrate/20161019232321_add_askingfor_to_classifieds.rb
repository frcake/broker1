class AddAskingforToClassifieds < ActiveRecord::Migration[5.0]
  def change
    add_column :classifieds, :askingfor, :boolean , :default => false
  end
end
