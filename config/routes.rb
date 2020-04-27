Rails.application.routes.draw do

  get 'message_board/index'
  get 'kit/new'
  post 'kit/thanks'

  devise_for :users,
    controllers: {
      registrations: 'users/registrations'
    }

  get 'public_portal/index'
  get '/clinic/search', to: 'public/clinics#index'
  post '/clinic/search', to: 'public/clinics#index'
  # get '/client/registration', to: 'public/patients#edit', as: :client_registration
  get '/client/registration(/:access_code)', to: 'public/patients#edit', as: :client_registration
  patch '/client/registration/(/:access_code)', to: 'public/patients#edit'

  get "/clear_session", to: 'public/patients#clear_session'


  resources :news_signups
  resources :patients
  resources :clinics, only: [:index, :new, :create, :edit, :update] do
    resources :patients
  end
  resources :clinic_events
  resources :supply_inventories 
  resources :test_kits
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'public_portal#index'
end
