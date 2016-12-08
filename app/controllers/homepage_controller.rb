class HomepageController < ApplicationController

def landing
  @giftcards = Giftcard.order(:created_at=>:desc).limit(3)

  @upcomingexp = Giftcard.where.not('expiration' => nil)
  @expirings = @upcomingexp.order(:expiration=>:desc).limit(3)
end

end
