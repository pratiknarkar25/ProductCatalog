require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  context "GET index" do
    it "assigns @products" do
      notebook1 = FactoryGirl.create(:notebook1)
      notebook2 = FactoryGirl.create(:notebook2)
      get :index
      products = assigns(:products).object
      expect(products.size).to eq(2)
      expect(products[0].name).to eq('notebook1')
      expect(products[1].name).to eq('notebook2')
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
  
  context "GET new" do
    it "renders the new template" do
      get "new"
      expect(response).to render_template("new")
    end
  end
    
  context "Create Notebook with valid params" do
    it "renders the index template" do
      post :create, params: { product: { "name": 'notebook1', "price": 100, "inward_date": rand(1..20).days.ago, 
                                          "type": "Notebook"}}
      expect(assigns(:product)).to be_a(Notebook)
      expect(flash[:notice]).to eq 'Product was successfully created.'
    end
  end

  context "Create Pen" do
    it "renders the index template for valid params" do
      post :create, params: { product: { "name": 'pen1', "price": 100, "inward_date": rand(1..20).days.ago, 
                                          "type": "Pen", color: "red"}}
      expect(assigns(:product)).to be_a(Pen)
      expect(flash[:notice]).to eq 'Product was successfully created.'
    end

    it "renders the new template for valid params" do
      post :create, params: { product: { "name": 'pen1', "price": 100, "inward_date": rand(1..20).days.ago, 
                                          "type": "Pen"}}
      expect(assigns(:product)).to be_a(Pen)
      expect(assigns(:product).errors.present?)
      expect(response).to render_template("new")
    end
  end
end