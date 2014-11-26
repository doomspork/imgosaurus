Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'

  resources :images, only: %i(create)
end
