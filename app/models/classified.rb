class Classified < ApplicationRecord
	
	belongs_to :user
	belongs_to :category
	has_many :photos, dependent: :destroy, inverse_of: :classified

	has_many :favorite_classifieds, dependent: :destroy
	has_many :favorited_by , through: :favorite_classifieds , source: :user #for the favorite_by to work :source is needed

	accepts_nested_attributes_for :photos


	searchable do 
		text :title , :model
	end
	

end
