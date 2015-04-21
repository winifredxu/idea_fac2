Rails.application.routes.draw do
  resources :ideas
  resources :sessions
  resources :users
  root 'idea#index'
end
