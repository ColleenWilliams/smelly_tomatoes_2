Rails.application.routes.draw do
  resources :directors
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth' }
  resources :users, only: [:show, :edit, :update]
  root "movies#index"
  resources :movies do
  resources :reviews
  end

end
