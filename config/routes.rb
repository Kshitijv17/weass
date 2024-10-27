Rails.application.routes.draw do
  root "dashboard#index"
  resources :users do
   resources :products do
    resources :orders
   end
  end
  resources :products
  
  # get 'dashboard', to: 'users#dashboard'
  resources :dashboard
  resources :orders
end
