Bars::Application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions" }

  root to: "bars#index"
  resources :bars do
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :reviews do
    resources :votes do
      collection do
        post 'upvote'
        post 'downvote'
      end
    end
  end
end
