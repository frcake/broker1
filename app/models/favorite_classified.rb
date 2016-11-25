class FavoriteClassified < ApplicationRecord
	belongs_to :user
	belongs_to :classified
end
