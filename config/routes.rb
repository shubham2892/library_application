Rails.application.routes.draw do
  get 'reservation/new'

  get 'reservation/destroy'

  devise_for :members
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :members
  root 'members#index'
end
