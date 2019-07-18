Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'auth/register', to: 'users#register'
  post 'auth/login', to: 'users#login'


  resources :articles do
      resources :comments
    end

    get "articles/:article_id/comments/:id", to: "comments#index"

  #resources :articles, param: :slug, except: [:index, :create, :edit, :new]
end
