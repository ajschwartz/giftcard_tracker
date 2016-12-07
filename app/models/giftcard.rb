class Giftcard < ActiveRecord::Base

    validates :amount, :presence => true, :numericality => {:greater_than_or_equal_to => 0}
    validates :date, :presence => true
    validates :code, :presence => true
    validates :retailer_id, :presence => true

    has_many :usages
    belongs_to :retailer
    belongs_to :user
    belongs_to :theme
    has_many :gifters, :through => :giftings, :source => :giver
    has_many :giftings

    def card_display
      "#{retailer.name}, #{ActionController::Base.helpers.number_to_currency(amount)}"
    end

    def current_balance
      amount-usages.sum(:amount)
    end

end
