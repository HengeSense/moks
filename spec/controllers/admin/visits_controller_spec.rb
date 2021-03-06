require File.dirname(__FILE__) + '/../spec_helper'

describe Admin::VisitsController do
  fixtures :all
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => Visit.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    Visit.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    Visit.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(admin_visit_url(assigns[:visit]))
  end

  it "edit action should render edit template" do
    get :edit, :id => Visit.first
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    Visit.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Visit.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    Visit.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Visit.first
    response.should redirect_to(admin_visit_url(assigns[:visit]))
  end

  it "destroy action should destroy model and redirect to index action" do
    visit = Visit.first
    delete :destroy, :id => visit
    response.should redirect_to(admin_visits_url)
    Visit.exists?(visit.id).should be_false
  end
end
