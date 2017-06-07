Rails.application.routes.draw do

  delete "session" => "sessions#destroy"
  get 'ajax_logout' => 'sessions#destroy', :as=> 'ajax_logout'
  
  resource :session

  get "signup" => "customers#new"

  get "empty_cart" => "customers#empty_cart"
  get "checkout" => "customers#checkout"
  
  patch "save_order" => "customers#save_order"

  get "save_order" => "customers#get_save_order"
  get "process_payment" => "customers#process_payment"
  get "process_payment_failed" => "customers#process_payment_failed"
  get "process_payment_success" => "customers#process_payment_success"


  root "products#index"

  post "products/:id" => "products#add_to_cart"  #, as: "add_to_cart_path" 
  get "products/empty_cart" => "products#empty_cart"

  resources :products

  resources :customers do
      resources :orders
  end
  
  resources :order_lines
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #  get "customers/[:id]/orders" => ""
end