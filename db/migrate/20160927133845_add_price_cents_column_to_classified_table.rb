class AddPriceCentsColumnToClassifiedTable < ActiveRecord::Migration[5.0]
  def change
  	add_column :classifieds , :price_cents , :integer 
  end
end
