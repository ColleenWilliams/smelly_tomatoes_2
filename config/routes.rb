Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  root "movies#index"
  resources :movies do
  resources :reviews
  end

end
