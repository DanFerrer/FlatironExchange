Rails.application.routes.draw do
  root 'welcome#index'
  get '/search', to: "search#index"
  get "/tags/:tag" => "questions#index", as: :tag
  resources :activities
  resources :questions do
    resources :answers
  end
  resources :users
  resources :sesssions
  resources :answers do
    member do
      post :vote_up
    end
  end
  get "/auth/github/callback", to: "sessions#create", as: :login
  get "/logout" => "sessions#destroy", as: :logout
  get "/members" => "users#index", as: :members
  get "/profile" => "users#show", as: :profile
  get "/results" => "search#index", as: :results
  get "/home" => "activities#index"
end
