class Classified < ApplicationRecord


  belongs_to :user
  belongs_to :category


  has_many :photos, dependent: :destroy, inverse_of: :classified

  has_many :favorite_classifieds, dependent: :destroy
  has_many :favorited_by , through: :favorite_classifieds , source: :user #for the favorite_by to work :source is needed
  has_many :flags
  has_many :flagged_by , through: :flags , source: :user

  accepts_nested_attributes_for :photos

  monetize :price_cents


  #validates :giveaway ,:presence => true, :unless => :sell?
  validate :classified_cant_be_giveaway_and_sell




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
    boolean :giveaway
    boolean :sell
    boolean :trade
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

  def classified_cant_be_giveaway_and_sell
    if giveaway? && sell?
      errors.add(:giveaway ,"Μια αγγελία δεν μπορεί να είναι ταυτόχρονα για πώληση και ανταλλαγή!")
    end
  end




end
