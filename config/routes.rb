Rails.application.routes.draw do

  devise_for :users

  get 'public_portal/index'
  get '/clinic/search', to: 'public/clinics#index'

  resources :news_signups
  resources :clinics, only: [:index]
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'public_portal#index'
end
