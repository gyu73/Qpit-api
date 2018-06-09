Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   namespace :api, { format: 'json' } do
     resources :hints, only: [:show,:update]
     resources :secret_hints, only: [:create, :show,:update]
     resources :users, only: [:show,:create]
     resources :homes, only: [:show]
     put '/users/:id/like-person', to: 'users#registerLikePerson'
     put '/secret_hints/users/:id', to: 'secret_hints#create'
   end
end
