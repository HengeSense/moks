class Admin::ResourcesController < Admin::BaseController
  def index
    @resources = Resource.all
  end

  def show
    @resource = Resource.find(params[:id])
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(params[:resource])
    if @resource.save
      redirect_to [:admin, @resource], :notice => "Successfully created resource."
    else
      render :action => 'new'
    end
  end

  def edit
    @resource = Resource.find(params[:id])
  end

  def update
    @resource = Resource.find(params[:id])
    if @resource.update_attributes(params[:resource])
      redirect_to [:admin, @resource], :notice  => "Successfully updated resource."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy
    redirect_to admin_resources_url, :notice => "Successfully destroyed resource."
  end
end
