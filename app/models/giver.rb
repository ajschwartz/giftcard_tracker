class Giver < ActiveRecord::Base

  validates :name, :presence => true, :uniqueness => {:scope =>:user_id}

  has_many :gifts, :through => :giftings, :source => :giftcard
  has_many :giftings

end
