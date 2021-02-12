Rails.application.routes.draw do
  devise_for :users,
    controllers: { registrations: 'registrations' } 

  root 'pages#home'
  get '/users/:id', to: 'users#show', as: 'user'

  get '/posts/new', to: 'posts#new'
  
  resources :posts, only: %i(new create) do
    resources :photos, only: %i(create)
  end
end
