class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, numericality: true
  validates :inward_date, inclusion: { in: proc { 1.month.ago..Date.today } }  
  self.inheritance_column = :type  

  def self.types
    %w(Notebook Pen)
  end

  def self.price_sum(product_type)
    where(type: product_type).sum(:price)
  end    
end