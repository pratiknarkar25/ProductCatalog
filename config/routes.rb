Rails.application.routes.draw do
  resources :products
  root 'products#index'
  resources :pens, controller: 'products', type: 'Pen'
	resources :notebooks, controller: 'products', type: 'Notebook' 
end
