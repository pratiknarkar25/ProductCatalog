require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_numericality_of(:price) }
    it { should validate_inclusion_of(:inward_date).in?([1.month.ago..Date.today]) } 
  end

  context "Calculate product total price" do
    it "should return all the product types" do
      expect(Product::TYPES).to eq(["Notebook", "Pen"])
    end

    it "should return all the notebooks price sum" do
      FactoryGirl.create(:notebook1)
      FactoryGirl.create(:notebook2)
      expect(Product.price_sum('Notebook')).to eq(167.25)
    end
  	
  	it "should return all the Pens price sum" do
      FactoryGirl.create(:pen1)
      FactoryGirl.create(:pen2)
      expect(Product.price_sum('Pen')).to eq(164.66)
    end
  end
end