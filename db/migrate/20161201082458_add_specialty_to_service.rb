class AddSpecialtyToService < ActiveRecord::Migration[5.0]
  def change
    add_column :services, :specialty, :string
  end
end
