class GiftingsController < ApplicationController
  def index
    @giftings = Gifting.all

    render("giftings/index.html.erb")
  end

  def show
    @gifting = Gifting.find(params[:id])

    render("giftings/show.html.erb")
  end

  def new
    @gifting = Gifting.new

    render("giftings/new.html.erb")
  end

  def create
    @gifting = Gifting.new

    @gifting.giver_id = params[:giver_id]
    @gifting.giftcard_id = params[:giftcard_id]

    save_status = @gifting.save

    if save_status == true
      redirect_to("/giftings/#{@gifting.id}", :notice => "Gifting created successfully.")
    else
      render("giftings/new.html.erb")
    end
  end

  def edit
    @gifting = Gifting.find(params[:id])

    render("giftings/edit.html.erb")
  end

  def update
    @gifting = Gifting.find(params[:id])

    @gifting.giver_id = params[:giver_id]
    @gifting.giftcard_id = params[:giftcard_id]

    save_status = @gifting.save

    if save_status == true
      redirect_to("/giftings/#{@gifting.id}", :notice => "Gifting updated successfully.")
    else
      render("giftings/edit.html.erb")
    end
  end

  def destroy
    @gifting = Gifting.find(params[:id])

    @gifting.destroy

    if URI(request.referer).path == "/giftings/#{@gifting.id}"
      redirect_to("/", :notice => "Gifting deleted.")
    else
      redirect_to(:back, :notice => "Gifting deleted.")
    end
  end
end
