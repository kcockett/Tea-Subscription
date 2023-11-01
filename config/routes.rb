Rails.application.routes.draw do
  namespace :api do
    namespace :v0 do
      resources :customers, only: [:create]
      resources :subscriptions, only: [:create]
    end
  end
end
