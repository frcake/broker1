class Classified < ApplicationRecord
	
	
	belongs_to :user
	belongs_to :category
	has_many :photos, dependent: :destroy, inverse_of: :classified

	has_many :favorite_classifieds, dependent: :destroy
	has_many :favorited_by , through: :favorite_classifieds , source: :user #for the favorite_by to work :source is needed

	accepts_nested_attributes_for :photos


	searchable do 
		text :title, :boost => 5
		text :model , :created_month , :make , :make_country , :condition , :price #TO BE CHANGED TO CURRENCY FORMAT
		
		time :created_at
		
		string :price #TO BE CHANGED TO CURRENCY FORMAT
		string :created_month	
		string :make_country
		string :condition
		string :make	
		string :model
	end

	def created_month 
		created_at.strftime("%B")
	end

	

end
