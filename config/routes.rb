Rails.application.routes.draw do
  resources :products
  resources :students
  resources :faculties
  resources :books
  resources :author
  resources :images
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post '/books/save', to: 'books#save', as: 'save'
  post '/author/save', to: 'author#save', as: 'author_save' 
  # Defines the root path route ("/")
  # root "articles#index"

end
