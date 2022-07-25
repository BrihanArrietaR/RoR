Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users/registrations",
                                      :sessions => "users/sessions"}
  root to: "home#index"

  post '/login',    to: 'sessions#create'
  post '/logout',   to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'

  scope module: :api do
    resources :users
    resources :orders
    resources :dishes
  end

  get 'search/create'
end
