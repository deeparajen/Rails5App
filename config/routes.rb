Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :products, only: [:index,:show]

  root 'products#index'
  
  get '/download(.:format)', :to => 'products#index', :as => 'products_pdf'
end
