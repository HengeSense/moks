class Admin::ImagesController < Admin::BaseController
  def index
    @images = Image.all
  end

  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(params[:image])
    if @image.save
      redirect_to [:admin, @image], :notice => "Successfully created image."
    else
      render :action => 'new'
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    if @image.update_attributes(params[:image])
      redirect_to [:admin, @image], :notice  => "Successfully updated image."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to admin_images_url, :notice => "Successfully destroyed image."
  end
end
