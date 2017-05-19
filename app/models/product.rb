class Product < ApplicationRecord
	validates :name, presence: true
	validates :price, numericality: true
	validates :inward_date, inclusion: { in: ((Date.today-1.month)..Date.today), 
		message: 'should be between last 1 month'}	
	validate :price_format_check

	self.inheritance_column = :type  
  scope :notebooks, -> { where(type: 'Notebook') }
  scope :pens, -> { where(race: 'Pen') }

	def self.types
   	%w(Notebook Pen)
  end

	def self.price_sum(product_type)
		Product.where("type=?", product_type).sum(:price)
	end
		
  private
	
	def price_format_check
		if price.present?
			price_string = price.to_s
			price_array = price_string.split('.')
			# For input interger value, we get value with decimal & zero
			allowed_size = (price_array[1] == '0') ? 10 : 9
			return self.errors.add(:price, 'is invalid' ) if price_string.size > allowed_size
			return self.errors.add(:price, 'is invalid' ) if price_array[1].size > 2
		end
	end

end
