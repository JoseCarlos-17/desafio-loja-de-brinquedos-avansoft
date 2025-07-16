Rails.application.routes.draw do
  mount_devise_token_auth_for 'Admin', at: 'admin_auth'

  namespace :internal do
    namespace :admin do
      resources :clients, only: [:index, :show, :destroy, :update]
    end
  end

  mount_devise_token_auth_for 'Client', at: 'client_auth'

  resources :clients, only: [:create, :show, :update] do
    delete "remove_account", on: :collection, to: "clients#remove_account"
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
