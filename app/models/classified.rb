class Classified < ApplicationRecord
	
	belongs_to :user
	belongs_to :category
	has_many :photos, dependent: :destroy, inverse_of: :classified
	accepts_nested_attributes_for :photos


	searchable do 
		text :title , :model
	end
	

end
