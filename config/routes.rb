Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  as :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
    delete 'logout', to: 'devise/sessions#destroy'
  end
  root 'pages#home'
  resources :products
  resources :categories
  resources :cart, only: [:show] do
    put 'add/:product_id', to: 'carts#add', as: 'add_to'
    put 'remove/:product_id', to: 'carts#remove', as: 'remove_from'
  end
end
