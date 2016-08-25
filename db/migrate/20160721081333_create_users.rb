class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|

     

    	t.string :first_name
    	t.string :email
    	t.string :password_digest
      t.string :region
      t.string :telephone
      t.string :stars

    	
    	
      t.timestamps
    end
  end
end
