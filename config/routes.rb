Rails.application.routes.draw do
  resources :line_items
  resources :carts
  devise_for :users, controllers: { registrations: 'registrations' }
  as :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
    delete 'logout', to: 'devise/sessions#destroy'
  end
  root 'pages#home'
  resources :products
  resources :categories
end
