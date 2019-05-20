Rails.application.routes.draw do
  get '/', { to: 'posts#index', as: 'root' }
  
  get '/signup', to: "users#new"
  resources :users, only: [ :create, :edit, :update, :show ]

  get '/users/:id/password', { to: "users#password", as: 'password' }
  patch '/users/:id/password', { to: "users#password_update", as: 'password_update' }

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  resource :session, only: [ :new, :create, :destroy ]
end
