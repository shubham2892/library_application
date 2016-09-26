Rails.application.routes.draw do

  devise_for :members
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'members/create_admin', to: 'members#create_admin', as:'create_admin'
  resources :rooms
  resources :members
  resources :reservations
  root 'members#home'

end
