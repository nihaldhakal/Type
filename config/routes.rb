Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  devise_for :users
  resources :races, except: [:destroy]
  resources :race_participants, only: [:create,:update,:new,:show, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
