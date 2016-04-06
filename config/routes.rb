Bars::Application.routes.draw do
  devise_for :users
  root to: "bars#index"

  resources :bars do
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  end
end
