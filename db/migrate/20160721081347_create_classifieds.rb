class CreateClassifieds < ActiveRecord::Migration[5.0]
  def change
    create_table :classifieds do |t|

    	t.string :make
        t.string :model
        t.string :year
        t.string :color

        t.string :title
        t.string :condition
        t.string :price
        t.string :offer

        t.string :make_country
        

        t.text :description
        
        t.references :user  
    	
      t.timestamps
    end
  end
end
