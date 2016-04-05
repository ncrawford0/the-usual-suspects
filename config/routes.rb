Bars::Application.routes.draw do
  devise_for :users
  root to: "bars#index"
end
