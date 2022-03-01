Rails.application.routes.draw do
  devise_for :my_users
  get 'home/index'
  root "home#index"
  resources :my_user
  devise_for :views
  resources :products
  resources :students
  resources :faculties
  resources :books
  resources :author
  resources :images
  resources :food_products do
    resources :food_orders,only: [:index, :show, :edit, :update, :destroy, :new, :create]
  end
  get '/food_orders', to: 'food_orders#show_all'
  
  resources :staffs, only: [:index, :show, :destroy, :update, :edit, :new, :create] do
    collection do
      get :search
    end
  end
  resources :users, only: [:new,:create] do
    collection do
      get :user_profile
    end
  end
  resources :events, only: [:index, :show, :destroy, :update, :edit, :new, :create] do
    member do
      get :user_enrol
    end
    collection do
      get :filter
      get :add_comment
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
  namespace :business do
    resources :buyers, only: [:index, :edit, :create] do
        get 'search', on: :collection
        get 'preview', on: :member
        delete 'delete_customer', on: :member
        patch 'update', on: :member
        get 'new', on: :collection, as: 'new'
    end
  end

  post '/books/save', to: 'books#save', as: 'save'
  post '/author/save', to: 'author#save', as: 'author_save' 
  #root "food_products#index"
end
