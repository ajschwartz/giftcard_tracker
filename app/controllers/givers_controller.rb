class GiversController < ApplicationController
  def index
    @givers = Giver.all

    render("givers/index.html.erb")
  end

  def show
    @giver = Giver.find(params[:id])

    render("givers/show.html.erb")
  end

  def new
    @giver = Giver.new

    render("givers/new.html.erb")
  end

  def create
    @giver = Giver.new

    @giver.name = params[:name]
    @giver.email = params[:email]
    @giver.user_id = params[:user_id]

    save_status = @giver.save

    if save_status == true
      redirect_to("/givers/#{@giver.id}", :notice => "Giver created successfully.")
    else
      render("givers/new.html.erb")
    end
  end

  def edit
    @giver = Giver.find(params[:id])

    render("givers/edit.html.erb")
  end

  def update
    @giver = Giver.find(params[:id])

    @giver.name = params[:name]
    @giver.email = params[:email]
    @giver.user_id = params[:user_id]

    save_status = @giver.save

    if save_status == true
      redirect_to("/givers/#{@giver.id}", :notice => "Giver updated successfully.")
    else
      render("givers/edit.html.erb")
    end
  end

  def destroy
    @giver = Giver.find(params[:id])

    @giver.destroy

    if URI(request.referer).path == "/givers/#{@giver.id}"
      redirect_to("/", :notice => "Giver deleted.")
    else
      redirect_to(:back, :notice => "Giver deleted.")
    end
  end
end
