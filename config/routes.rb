Rails.application.routes.draw do
  resources :products
  resources :books
  resources :author
  resources :images
  resources :employees

  get 'employees/search_page/search', to: 'employees#search', as: 'search'
  get 'employees/search_page/search' ,to: 'employees#find', as: 'find'
  get 'employees/query/increment' ,to: 'employees#increment', as: 'increment'
  get 'employees/query/decrement' ,to: 'employees#decrement', as: 'decrement'
  get 'employees/database/queries' ,to: 'employees#queries', as: 'queries'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post '/books/save', to: 'books#save', as: 'save'
  post '/author/save', to: 'author#save', as: 'author_save' 
  # Defines the root path route ("/")
  # root "articles#index"
end
