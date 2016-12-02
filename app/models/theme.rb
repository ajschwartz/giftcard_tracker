class Theme < ActiveRecord::Base
  
    validates :category, :presence => true, :uniqueness => true

    has_many :giftcards

end
