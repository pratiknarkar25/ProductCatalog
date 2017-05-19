require 'rails_helper'

RSpec.describe Product, type: :model do
 context "Product mothods" do
    it "should return all the product types" do
      expect(Product.types).to eq(["Notebook", "Pen"])
    end

    it "should return all the notebooks price sum" do
      product1 = Product.create!({"name"=>"Bottle", "price"=>"100", "inward_date(1i)"=>"2017", 
      	"inward_date(2i)"=>"5", "inward_date(3i)"=>"19", "type"=>"Notebook"})
      product2 = Product.create!({"name"=>"Bottle", "price"=>"80", "inward_date(1i)"=>"2017", 
      	"inward_date(2i)"=>"5", "inward_date(3i)"=>"19", "type"=>"Notebook"})
      expect(Product.price_sum('Notebook')).to eq(180)
    end
  	
  	it "should return all the Pens price sum" do
      product1 = Product.create!({"name"=>"Bottle", "price"=>"100", "inward_date(1i)"=>"2017", 
      	"inward_date(2i)"=>"5", "inward_date(3i)"=>"19", "type"=>"Pen", color: 'red'})
      product2 = Product.create!({"name"=>"Bottle", "price"=>"80", "inward_date(1i)"=>"2017", 
      	"inward_date(2i)"=>"5", "inward_date(3i)"=>"19", "type"=>"Pen", color: 'red'})
      expect(Product.price_sum('Pen')).to eq(180)
    end
  end
end