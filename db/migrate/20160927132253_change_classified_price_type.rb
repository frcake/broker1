class ChangeClassifiedPriceType < ActiveRecord::Migration[5.0]
  def change
  	 change_table :classifieds do |t|
      t.change :price, :integer
    end
  end
end
