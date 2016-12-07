class Usage < ActiveRecord::Base

    validates :date, :presence => true
    validates :purchase, :presence => true
    validates :amount, :presence => true, :numericality => {:greater_than_or_equal_to => 0}

    belongs_to :giftcard

end
