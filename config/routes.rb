Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/about', as: 'home/about'
  devise_for :users, controllers: {
        sessions:      'users/sessions',
        passwords:     'users/passwords',
        registrations: 'users/registrations'
    }
  root 'static_pages#home'
  get 'users', to: 'users#index'
  resources :users, only: [:show, :edit, :update]
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
