class Giver < ActiveRecord::Base

  validates :name, :presence => true, :uniqueness => true

  has_many :giftcards

end
