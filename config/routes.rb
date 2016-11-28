Rails.application.routes.draw do

  root "static_pages#home"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  resources :users

  get "/:page", to: "static_pages#show"
end
