class RemovePrcandPriceColumn < ActiveRecord::Migration[5.0]
  def change
  	remove_column :classifieds,:prc
  	remove_column :classifieds,:price
  end
end
