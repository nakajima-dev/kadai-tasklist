Rails.application.routes.draw do
  # ユーザー登録
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :create]
  
  # ログイン、ログアウトセッション
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'tasks#index'
  resources :tasks
end
