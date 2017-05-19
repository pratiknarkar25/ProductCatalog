class ProductDecorator < Draper::Decorator
  delegate_all
  def formatted_inward_date
	  self.inward_date.strftime("%m/%d/%Y") rescue "No Inward Date Available"
  end
end
