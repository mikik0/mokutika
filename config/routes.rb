Rails.application.routes.draw do
  get 'dones/show'
  devise_for :users
  resources :goals
  resources :dones, only: [:create, :destroy, :show]
  root  'goals#index'
  devise_scope :user do
    get "signup", to: "devise/registrations#new"
    get "login", to: "devise/sessions#new"
    get "logout", to: "devise/sessions#destroy"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
