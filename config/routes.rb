Twitterclone::Application.routes.draw do

  devise_for :users

  resources :users
  resources :tweets
  resources :relationships

  root :to => "static_pages#index"
end
