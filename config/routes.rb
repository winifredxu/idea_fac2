Rails.application.routes.draw do
  resources :ideas
  resources :sessions
  resources :users
  root 'ideas#index'
end
