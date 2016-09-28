class Classified < ApplicationRecord
	
	
	belongs_to :user
	belongs_to :category


	has_many :photos, dependent: :destroy, inverse_of: :classified

	has_many :favorite_classifieds, dependent: :destroy
	has_many :favorited_by , through: :favorite_classifieds , source: :user #for the favorite_by to work :source is needed

	accepts_nested_attributes_for :photos

	monetize :price_cents

	searchable do 
		text :title, :boost => 5
		text :model , :created_month , :make , :make_country , :condition ,:cat,:price #TO BE CHANGED TO CURRENCY FORMAT
		#text :treecat #, :multiple => true
		time :created_at
		integer :categoryid
		
		string :treecat, :multiple => true
		string :price #TO BE CHANGED TO CURRENCY FORMAT
		string :created_month	
		string :cat
		string :make_country
		string :condition
		string :make	
		string :model
		integer :price
	end

	def cat 
		category.root.name
	end

	def treecat		
		category.name unless category.name == category.root.name
	end

	def categoryid
		category.id
	end


	def created_month 
		created_at.strftime("%d/%m/%y")
	end

	
		

end
