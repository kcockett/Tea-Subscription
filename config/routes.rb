Rails.application.routes.draw do
  namespace :api do
    namespace :v0 do
      resources :customers, only: [:create] do
        resources :subscriptions, only: [:index]
      end
      resources :subscriptions, only: [:create, :destroy]
    end
  end
end
