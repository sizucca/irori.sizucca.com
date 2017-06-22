Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'login#index'
  
  get 'login', to: 'login#index'
end
