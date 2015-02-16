Rails.application.routes.draw do

  #client app
  root 'home#index'

  #proxy to sports
  resources :sports, only: [:index]

  #translation support
  resources :translations, only: :show

end
