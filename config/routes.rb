Rails.application.routes.draw do

  get 'message_board/index'
  get 'kit/new', to: 'public/kit#new'
  post 'kit/create', to: 'public/kit#create'

  devise_for :users,
    controllers: {
      registrations: 'users/registrations',
      invitations: 'users/invitations'
    }

  get 'public_portal/index'
  get '/clinic/search', to: 'public/clinics#index'
  post '/clinic/search', to: 'public/clinics#index'
  get '/clinic/data_transfer', to: 'clinics#data_transfer'
  # get '/client/registration', to: 'public/patients#edit', as: :client_registration
  get '/client/registration(/:access_code)', to: 'public/patients#edit', as: :client_registration
  patch '/client/registration/(/:access_code)', to: 'public/patients#edit'
  
  get "/clear_session", to: 'public/patients#clear_session'


  resources :news_signups
  resources :patients
  resources :clinics, only: [:index, :new, :create, :edit, :update] do
    get :activity
    resources :patients
  end
  resources :clinic_events
  resources :supply_inventories 
  resources :test_kits
  resources :provider_enrollments
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'public_portal#index'
end
