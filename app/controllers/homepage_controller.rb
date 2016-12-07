class HomepageController < ApplicationController

def landing
  @giftcards = Giftcard.order(:created_at=>:desc).limit(3)

  @expirings = Giftcard.order(:expiration=>:asc).last(3)

end

end
