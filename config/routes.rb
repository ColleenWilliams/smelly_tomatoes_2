Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # get 'home/index'

  authenticated :user do
    root "movies#index", as: 'authenticated_root'
  end
  devise_scope :user do
    root 'devise/sessions#new'
  end

  resources :directors

  # resources :users, only: [:show, :edit, :update]
  resources :movies do
  resources :reviews  end


  get 'popular', to: 'movies#popular'
  get 'privacypolicy', to: 'home#privacypolicy'

end
