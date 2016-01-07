Rails.application.routes.draw do


  root 'home#homepage'

  get "/search" => "users#search"

  get "/sign_in" => "sessions#new"
  post "/sign_in" => "sessions#create"
  get "/sign_up" => "users#new"
  post "/sign_up" => "users#create"
  get "/users/sign_out" => "sessions#destroy"


  resources :users
  resources :posts do
    resources :comments, shallow: true, only:[:create, :destroy]
  end
end