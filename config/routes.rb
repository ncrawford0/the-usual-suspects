Bars::Application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions" }

  root to: "bars#index"
  resources :bars
end
