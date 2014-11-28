# -*- encoding : utf-8 -*-
Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  root 'home#index'

  resources :images, only: %i(create)
end
