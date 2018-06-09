Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   namespace :api, { format: 'json' } do
     resources :hints, only: [:show,:update]
     resources :secret_hints, only: [:create, :show,:update]
     resources :users, only: [:create]
     put '/users/:id/like-person', to: 'users#registerLikePerson'
     put '/secret_hints/users/:id', to: 'secret_hints#create'
     put '/hints/users/:id', to: 'hints#create'
     get '/users/:id/likeperson/secret-hint', to: 'users#getLikePersonSecretHint'
     get '/users/:id/likeperson/normal-hint', to: 'users#getLikePersonNormalHint'
   end
end
