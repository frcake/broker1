class AddHoldColumnToClassified < ActiveRecord::Migration[5.0]
  def change
  	add_column :classifieds , :hold , :boolean , :default => false
  end
end

