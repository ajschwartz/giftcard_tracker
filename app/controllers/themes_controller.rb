class ThemesController < ApplicationController
  def index
    @themes = Theme.all

    render("themes/index.html.erb")
  end

  def show
    @theme = Theme.find(params[:id])

    render("themes/show.html.erb")
  end

  def new
    @theme = Theme.new

    render("themes/new.html.erb")
  end

  def create
    @theme = Theme.new

    @theme.category = params[:category]

    save_status = @theme.save

    if save_status == true
      redirect_to("/themes/#{@theme.id}", :notice => "Theme created successfully.")
    else
      render("themes/new.html.erb")
    end
  end

  def edit
    @theme = Theme.find(params[:id])

    render("themes/edit.html.erb")
  end

  def update
    @theme = Theme.find(params[:id])

    @theme.category = params[:category]

    save_status = @theme.save

    if save_status == true
      redirect_to("/themes/#{@theme.id}", :notice => "Theme updated successfully.")
    else
      render("themes/edit.html.erb")
    end
  end

  def destroy
    @theme = Theme.find(params[:id])

    @theme.destroy

    if URI(request.referer).path == "/themes/#{@theme.id}"
      redirect_to("/", :notice => "Theme deleted.")
    else
      redirect_to(:back, :notice => "Theme deleted.")
    end
  end
end
