class User < ApplicationRecord
	
	has_secure_password
	has_many :classifieds , dependent: :destroy

	has_many :favorite_classifieds , dependent: :destroy
	has_many :favorites  , through: :favorite_classifieds , source: :classified #for the favorites to work :source is needed

end
