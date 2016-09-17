class Category < ApplicationRecord

	acts_as_nested_set
	has_many :classifieds

	searchable do 
		text :name, :boost => 2
		
		string :name
	end

end
