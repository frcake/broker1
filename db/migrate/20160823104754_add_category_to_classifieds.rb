class AddCategoryToClassifieds < ActiveRecord::Migration[5.0]
  def change
    add_reference :classifieds, :category, foreign_key: true
  end
end
