class AddUserToServices < ActiveRecord::Migration[5.0]
  def change
    add_reference :services, :user, foreign_key: true
  end
end
