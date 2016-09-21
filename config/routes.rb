Rails.application.routes.draw do
  devise_for :members
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :members, only: [:index,:show,:destroy]
  root 'members#index'
end
