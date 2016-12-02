class Usage < ActiveRecord::Base

    validates :date, :presence => true
    validates :purchase, :presence => true
    validates :amount, :presence => true

    belongs_to :giftcard

end
