class AddPricingToService < ActiveRecord::Migration[5.0]
  def change
    add_column :services, :price_cents, :integer
  end
end
