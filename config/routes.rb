Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'auth/register', to: 'users#register'
  post 'auth/login', to: 'users#login'

  resources :users

  resources :articles do
      resources :comments
    end
    resources :categories
end
