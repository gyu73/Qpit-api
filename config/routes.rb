Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   namespace :api, { format: 'json' } do
     # users
     resources :users, only: [:create]
     put '/users/:id/like-person', to: 'users#registerLikePerson'
     get '/users/:id', to: 'users#getUserInfo'
     get '/users/:id/likeperson/secret-hint', to: 'users#getLikePersonSecretHint'
     get '/users/:id/likeperson/normal-hint', to: 'users#getLikePersonNormalHint'
     put '/users/:id/arrow', to: 'users#getArrow'
     delete '/users/:id', to: 'users#logout'
     delete '/users/:id/delete', to: 'users#delete'

     # secret_hints
     get '/secret_hints/users/:id', to: 'secret_hints#index'
     put '/secret_hints/users/:id', to: 'secret_hints#create'

     # hints
     get '/hints/users/:id', to: 'hints#index'
     put '/hints/users/:id', to: 'hints#create'
   end
end
