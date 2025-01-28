Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  root "articles#index"
  resources :articles do
    resources :comments
  end
  get "up" => "rails/health#show", as: :rails_health_check
end
