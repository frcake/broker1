class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  ratyrate_rater
  ratyrate_rateable 'rating'
  
  acts_as_messageable

  #has_secure_password
  has_many :classifieds , dependent: :destroy


  has_many :favorite_classifieds , dependent: :destroy
  has_many :flags
  has_many :favorites  , through: :favorite_classifieds , source: :classified #for the favorites to work :source is needed
  has_many :flaggings , through: :flags , source: :classified

  def name
    first_name
  end

  def mailboxer_email(object)
    email
  end
end
