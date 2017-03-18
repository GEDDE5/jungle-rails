Rails.application.routes.draw do

  root to: 'products#index'

  resource :users, path: "/register", only: [:show, :create]

  resources :users, only: [:show, :create] do
    root to: "logins#show"
    resource :reviews, only: [:show]
  end

  namespace :session do
    root to: "logins#show"
    resource :login, path: "/login", only: [:show, :create]
    resource :logout, path: "/logout", only: [:destroy]
  end

  resources :products, only: [:index, :show] do
    resources :reviews, only: [:create]
    resources :reviews, only: [:destroy]
  end

  resources :categories, only: [:show]

  resource :cart, only: [:show] do
    put    :add_item
    delete :remove_item
  end

  resources :orders, only: [:create, :show]

  namespace :admin do
    root to: 'dashboard#show'
    resources :products, except: [:edit, :update, :show]
    resources :categories, except: [:edit, :update, :show, :destroy]
  end

  # for letter_opener to work w/ vagrant
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
