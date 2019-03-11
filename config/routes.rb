Rails.application.routes.draw do
  devise_for :users
  as :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
    delete 'logout', to: 'devise/sessions#destroy'
  end
  root 'pages#home'
end
