Rails.application.routes.draw do
  root  'goals#mypage'
  get 'dones/show'
  devise_for :users
  resources :goals do
     resource :follows, only: [:create, :destroy]
  end
  resources :dones, only: [:create, :destroy]
  root  'goals#index'
  devise_scope :user do
    get "signup", to: "devise/registrations#new"
    get "login", to: "devise/sessions#new"
    get "logout", to: "devise/sessions#destroy"
  end
  get "mypage" => "goals#mypage"
  post "goals/:goal_id/join", to: "goals#join", as: :goals_join
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
