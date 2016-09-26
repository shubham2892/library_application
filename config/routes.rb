Rails.application.routes.draw do

  devise_for :members
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :rooms
  resources :members
  resources :reservations
  get '/roomhistory/:id', to: 'reservation#roomhistory',  via: :get, as: :room_history
  get '/memberhistory/:id', to: 'reservation#memberhistory', via: :get, as: :member_history

  root 'members#home'

end
