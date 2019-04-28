Rails.application.routes.draw do
  get '/', { to: 'posts#index', as: 'root'}
  
  get '/signup', to: "users#new"
  post '/users', to: "users#create"

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  resource :session, only: [ :new, :create, :destroy ]
end
