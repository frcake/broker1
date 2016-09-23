class Category < ApplicationRecord

	acts_as_nested_set
	has_many :classifieds

	searchable do 

		




	end

end



=begin	
searchable do 
		text :title, :boost => 5
		text :model , :created_month , :make , :make_country , :condition ,:cat,:price #TO BE CHANGED TO CURRENCY FORMAT
		
		time :created_at
		
		string :price #TO BE CHANGED TO CURRENCY FORMAT
		string :created_month	
		string :cat
		string :make_country
		string :condition
		string :make	
		string :model
	end

	def cat 
		category.root.name
	end


	def created_month 
		created_at.strftime("%B")
	end
=end

