Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'auth/register', to: 'users#register'
  post 'auth/login', to: 'users#login'
  get 'test', to: 'users#test'

  get 'articles/:id', to: 'articles#show'

  resources :articles
  resources :users

  #get 'articles/:id', to: 'articles#'

  #resources :articles, param: :slug, except: [:index, :create, :edit, :new]
end
