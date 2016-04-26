Rails.application.routes.draw do
  root to: 'posts#index'
  resources :posts do
    member do
      post :rate
    end
  end

  devise_for :users
  resources :users

  get '/visitors/index', to: 'visitors#index'
end
