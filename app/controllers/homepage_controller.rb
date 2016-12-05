class HomepageController < ApplicationController

def landing
  @giftcards = Giftcard.all

end

end
