class AddPriceToClassified < ActiveRecord::Migration[5.0]
  def change
  	add_column :classifieds , :prc , :integer
  end
end
