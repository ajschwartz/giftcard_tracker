class RetailersController < ApplicationController
  def index
    @retailers = Retailer.all

    render("retailers/index.html.erb")
  end

  def show
    @retailer = Retailer.find(params[:id])

    render("retailers/show.html.erb")
  end

  def new
    @retailer = Retailer.new

    render("retailers/new.html.erb")
  end

  def create
    @retailer = Retailer.new

    @retailer.name = params[:name]
    @retailer.website = params[:website]

    save_status = @retailer.save

    if save_status == true
      redirect_to("/retailers/#{@retailer.id}", :notice => "Retailer created successfully.")
    else
      render("retailers/new.html.erb")
    end
  end

  def edit
    @retailer = Retailer.find(params[:id])

    render("retailers/edit.html.erb")
  end

  def update
    @retailer = Retailer.find(params[:id])

    @retailer.name = params[:name]
    @retailer.website = params[:website]

    save_status = @retailer.save

    if save_status == true
      redirect_to("/retailers/#{@retailer.id}", :notice => "Retailer updated successfully.")
    else
      render("retailers/edit.html.erb")
    end
  end

  def destroy
    @retailer = Retailer.find(params[:id])

    @retailer.destroy

    if URI(request.referer).path == "/retailers/#{@retailer.id}"
      redirect_to("/", :notice => "Retailer deleted.")
    else
      redirect_to(:back, :notice => "Retailer deleted.")
    end
  end
end
