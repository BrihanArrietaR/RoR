Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users/registrations",
                                      :sessions => "users/sessions"}
  root to: "home#index"

  scope module: :api do
    resources :users
    resources :orders
    resources :dishes
  end

  get 'search/create'
end
