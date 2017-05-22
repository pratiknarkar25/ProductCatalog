FactoryGirl.define do
  factory :product do
     
    factory :notebook1 do
      name 'notebook1'
      price 100
      inward_date { rand(1..20).days.ago } 
      type "Notebook"
    end

    factory :notebook2 do
      name 'notebook2'
      price 67.25
      inward_date { rand(1..20).days.ago } 
      type "Notebook"
    end

   factory :pen1 do
      name 'pen1'
      price 100.33
      inward_date { rand(1..20).days.ago } 
      type "Pen"
   end

   factory :pen2 do
      name 'pen2'
      price 64.33
      inward_date { rand(1..20).days.ago } 
      type "Pen"
   end

  end
end
