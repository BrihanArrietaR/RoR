Rails.application.routes.draw do
  resources :orders
  devise_for :users, :controllers => {:registrations => "users/registrations",
                                      :sessions => "users/sessions"}
  resources :users
  root to: "home#index"
end
