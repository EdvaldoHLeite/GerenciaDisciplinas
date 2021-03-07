Rails.application.routes.draw do
  resources :turmas
  resources :users
  root 'welcome#home'

  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  delete "/sessions", to: "sessions#destroy"
end
