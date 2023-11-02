Rails.application.routes.draw do
  namespace :api do
    namespace :v0 do
      resources :customers, only: [:create] do
        resources :subscriptions, only: [:index, :create, :update]
      end
      resources :teas, only: [:index]
    end
  end
end
