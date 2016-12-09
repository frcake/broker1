class Service < ApplicationRecord

  belongs_to :user
  has_many :photos, dependent: :destroy, inverse_of: :service
  acts_as_taggable_on :tags
  accepts_nested_attributes_for :photos
  monetize :price_cents

  searchable do
  	text :categ
  	text :tags

  	string :categ
  	string :tags
  end

end
