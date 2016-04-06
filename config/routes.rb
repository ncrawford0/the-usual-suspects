Bars::Application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions" }

  root to: "bars#index"
  resources :bars do
    resources :reviews, only: [:create]
  end

  resources :reviews, only: [:create]
end


# , :edit, :update, :destroy, :new
