# -*- encoding : utf-8 -*-
Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'

  resources :images, only: %i(create)

  # rubocop:disable Metrics/LineLength
  devise_for :users, path: '/accounts', controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  # rubocop:enable Metrics/LineLength
end
