Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :members, only: [:index,:show,:destroy]
  #resources :UsersController only: [:index,:show,:destroy,:new,:create]
  resources :users
  post "/path/to/your/new/page", to: "users#new", as: "new"

end
