Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   namespace :api, { format: 'json' } do
     resources :hints, only: [:show,:update]
     resources :secret_hints, only: [:show,:update]
     resources :users, only: [:show,:update]
     resources :homes, only: [:show]
   end
end
