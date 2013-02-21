require File.dirname(__FILE__) + '/../spec_helper'

describe Admin::BudgetareasController do
  fixtures :all
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => Budgetarea.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    Budgetarea.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    Budgetarea.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(admin_budgetarea_url(assigns[:budgetarea]))
  end

  it "edit action should render edit template" do
    get :edit, :id => Budgetarea.first
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    Budgetarea.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Budgetarea.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    Budgetarea.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Budgetarea.first
    response.should redirect_to(admin_budgetarea_url(assigns[:budgetarea]))
  end

  it "destroy action should destroy model and redirect to index action" do
    budgetarea = Budgetarea.first
    delete :destroy, :id => budgetarea
    response.should redirect_to(admin_budgetareas_url)
    Budgetarea.exists?(budgetarea.id).should be_false
  end
end
