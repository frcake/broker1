class AddRegionsToService < ActiveRecord::Migration[5.0]
  def change
    add_column :services, :regions, :string
  end
end
