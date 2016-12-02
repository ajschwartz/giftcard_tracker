class Giftcard < ActiveRecord::Base

    validates :amount, :presence => true
    validates :date, :presence => true
    validates :code, :presence => true
    validates :retailer_id, :presence => true

    has_many :usages
    belongs_to :retailer
    belongs_to :user
    belongs_to :theme
    has_many :gifters, :through => :giftings, :source => :giver

end
