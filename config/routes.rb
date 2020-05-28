Rails.application.routes.draw do

  get 'kit/new', to: 'public/kit#new'
  post 'kit/create', to: 'public/kit#create'
  get 'pages/landing_page'
  get 'pages/boom'
  
  devise_for :users,
  controllers: {
    registrations: 'users/registrations',
    invitations: 'users/invitations',
    sessions: 'users/sessions'
  }
  
  get 'public_portal/index'
  get '/clinic/search', to: 'public/clinics#index'
  post '/clinic/search', to: 'public/clinics#index'
  get '/clinic/data_transfer', to: 'clinics#data_transfer'
  # get '/client/registration', to: 'public/patients#edit', as: :client_registration
  get '/client/access', to: 'public/patients#access'
  get '/client/registration(/:access_code)', to: 'public/patients#edit', as: :client_registration
  patch '/client/registration/(/:access_code)', to: 'public/patients#edit'
  post '/client/registration/(/:access_code)', to: 'public/patients#create'
  
  get "/clear_session", to: 'public/patients#clear_session'
  get '/clinics/:id/patients/upload_record', to: 'patients#upload_record'

  resources :news_signups, only: [:new, :create]
  resources :patients
  resources :clinics, only: [:index, :new, :create, :edit, :update] do
    get :activity
    resources :patients
  end
  resources :customized_reports
  resources :clinic_events
  resources :supply_inventories
  resources :supply_inventory_events
  resources :test_kits
  resources :provider_enrollments
  resources :messages, only: [:new, :create]
  resources :employers, only: [:index, :new, :create]
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'public_portal#index'
end
