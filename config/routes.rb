Bars::Application.routes.draw do
  devise_for :admins
  devise_for :users, controllers: { sessions: "users/sessions" }

  root to: "bars#index"
  resources :bars do
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :admins, only: [:index, :create, :destroy]
  get "make_admin", to: "admins#make_admin"
  resources :users, only: [:index, :create, :destroy]
end
