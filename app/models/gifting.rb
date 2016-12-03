class Gifting < ActiveRecord::Base

    validates :giver_id, :presence => true, :uniqueness => {:scope =>:giftcard_id}
    validates :giftcard_id, :presence => true

    belongs_to :giver
    belongs_to :giftcard

end
