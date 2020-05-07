Rails.application.routes.draw do
  root to: "programs#index"
  devise_for :users
  resources :programs

  resources :users, only: :show
end
