Rails.application.routes.draw do
<<<<<<< HEAD
  get 'toppages/index'
=======
  # get 'toppages/index'
  root to: 'toppages#index'
>>>>>>> 8dca9d3091c5065dd097527c87232f3b8f131a1d
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: 'tasks#index'
  resources :tasks
end
