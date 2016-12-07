class GiftcardsController < ApplicationController
  def index
    @giftcards = Giftcard.all

    render("giftcards/index.html.erb")
  end

  def index_theme
    @giftcards = Giftcard.where(:theme_id=>params[:theme_id])
    @theme=Theme.find(params[:theme_id])
    render("giftcards/index_theme.html.erb")
  end

  def show
    @giftcard = Giftcard.find(params[:id])
    @gifting = Gifting.new

    render("giftcards/show.html.erb")
  end

  def new
    @giftcard = Giftcard.new

    render("giftcards/new.html.erb")
  end

  def create
    @giftcard = Giftcard.new

    @giftcard.user_id = params[:user_id]
    @giftcard.amount = params[:amount]
    @giftcard.date = params[:date]
    @giftcard.retailer_id = params[:retailer_id]
    @giftcard.code = params[:code]
    @giftcard.expiration = params[:expiration]
    @giftcard.cardcvv = params[:cardcvv]
    @giftcard.notes = params[:notes]
    @giftcard.theme_id = params[:theme_id]

    save_status = @giftcard.save

    if save_status == true
      redirect_to("/giftcards", :notice => "Giftcard created successfully.")
    else
      render("giftcards/new.html.erb")
    end
  end

  def edit
    @giftcard = Giftcard.find(params[:id])

    render("giftcards/edit.html.erb")
  end

  def update
    @giftcard = Giftcard.find(params[:id])

    @giftcard.user_id = params[:user_id]
    @giftcard.amount = params[:amount]
    @giftcard.date = params[:date]
    @giftcard.retailer_id = params[:retailer_id]
    @giftcard.code = params[:code]
    @giftcard.expiration = params[:expiration]
    @giftcard.cardcvv = params[:cardcvv]
    @giftcard.notes = params[:notes]
    @giftcard.theme_id = params[:theme_id]

    save_status = @giftcard.save

    if save_status == true
      redirect_to("/giftcards/#{@giftcard.id}", :notice => "Giftcard updated successfully.")
    else
      render("giftcards/edit.html.erb")
    end
  end

  def destroy
    @giftcard = Giftcard.find(params[:id])

    @giftcard.destroy

    if URI(request.referer).path == "/giftcards/#{@giftcard.id}"
      redirect_to("/", :notice => "Giftcard deleted.")
    else
      redirect_to(:back, :notice => "Giftcard deleted.")
    end
  end
end
