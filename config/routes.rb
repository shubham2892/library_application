Rails.application.routes.draw do

  devise_for :members
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :rooms
  resources :members
  resources :reservations
  get 'roomhistory', to: 'reservations#roomhistory',  via: :get, as: :room_history
  get 'memberhistory', to: 'reservations#memberhistory', via: :get, as: :member_history
  root 'members#home'

end
