Rails.application.routes.draw do
  resources :products
  resources :students
  resources :faculties
  resources :books
  resources :author
  resources :images
  resources :staffs, only: [:index, :show, :destroy, :update, :edit, :new, :create] do
    collection do
      get :search
    end
  end
  resources :customers, only: [:index, :show, :delete, :update, :edit, :new, :create] do
    collection do
      get :most_booked_order_of_product
      get :most_cancelled_order_of_product
      get :most_sales_product_by_price
      get :most_sales_product_by_quantity
    end
  end
  resources :orders, only: [:index, :show, :delete, :update, :edit, :new, :create] do
    collection do
      get :search
      get :filter_data
    end
  end
  resources :shopproducts, only: [:index, :show, :delete, :update, :edit, :new, :create] do
    collection do
      get :display_all_products
      get :display_all_products_default
      get :search
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post '/books/save', to: 'books#save', as: 'save'
  post '/author/save', to: 'author#save', as: 'author_save' 
  root "customers#home"
  # Defines the root path route ("/")
  # root "articles#index"
end
