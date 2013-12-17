class Admin::PagesController < Admin::BaseController

  layout 'admin'

  def index
    @pages = Page.order("position")
  end
  
  def new
    @page = Page.new
  end

  def edit
    @page = Page.find(params[:id])
  end

  def create
    @page = Page.new(ad_params)

    if @page.save
      flash[:success] = "Page created!"
      redirect_to admin_pages_path
    else
      render action: "new"
    end
  end

  def update
    @page = Page.find(params[:id])

    if @page.update_attributes(ad_params)
      flash[:success] = "Page was successfully updated!"
      redirect_to admin_pages_path
    else
      render action: "edit"
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    redirect_to admin_pages_url
  end

  def reorder
    @pages = Page.all
    @pages.each do |page|
      page.position = params[:items].index(page.id.to_s) + 1
      page.save 
    end
    render :nothing => true
  end


  private
    def ad_params
    params.require(:page).permit(:title, :parent_id, :content, :position)
  end
end
