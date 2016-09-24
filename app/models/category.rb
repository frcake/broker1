class Category < ApplicationRecord
	 def nested_classifieds
    	Classified.where(category_id: self_and_descendants.select(:id))
	end

	def nested_categories
		self_and_descendants	
	end



	acts_as_nested_set
	has_many :classifieds

	searchable do
		text :name
		string :name
		

	
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

