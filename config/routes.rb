Bars::Application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions" }

  root to: "bars#index"
  resources :bars do
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  end
end
