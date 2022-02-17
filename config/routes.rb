Rails.application.routes.draw do
  resources :products
  resources :students
  resources :faculties
  resources :books
  resources :author
  resources :images
  resources :users, only: [:new,:create] do
    collection do
      get :user_profile
    end
  end
  resources :sessions
  resources :events, only: [:index, :show, :destroy, :update, :edit, :new, :create] do
    member do
      get :user_enrol
    end
    collection do
      get :filter
      get :add_comment
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post '/books/save', to: 'books#save', as: 'save'
  post '/author/save', to: 'author#save', as: 'author_save' 
  # Defines the root path route ("/")
  # root "articles#index"
end
