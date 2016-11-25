class AddClassifiedToFlags < ActiveRecord::Migration[5.0]
  def change
    add_reference :flags, :classified, foreign_key: true
  end
end
