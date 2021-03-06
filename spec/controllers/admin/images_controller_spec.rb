require File.dirname(__FILE__) + '/../spec_helper'

describe Admin::ImagesController do
  fixtures :all
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => Image.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    Image.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    Image.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(admin_image_url(assigns[:image]))
  end

  it "edit action should render edit template" do
    get :edit, :id => Image.first
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    Image.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Image.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    Image.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Image.first
    response.should redirect_to(admin_image_url(assigns[:image]))
  end

  it "destroy action should destroy model and redirect to index action" do
    image = Image.first
    delete :destroy, :id => image
    response.should redirect_to(admin_images_url)
    Image.exists?(image.id).should be_false
  end
end
