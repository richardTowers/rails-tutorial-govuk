Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  root "articles#index"
  resources :articles do
    resources :comments
  end
end
