Rails.application.routes.draw do

  get 'kit/new', to: 'public/kit#new'
  post 'kit/create', to: 'public/kit#create'
  get 'pages/landing_page'
  get 'pages/reports_menu'
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
  post '/client/registration/(/:access_code)', to: 'public/patients#update'

  get '/check_in/:check_in_code', to: 'public/patients#check_in', as: :check_in

  get "/clear_session", to: 'public/patients#clear_session'
  get 'patients/upload_records', to: 'patients#upload_records'
  post 'patients/upload_records', to: 'patients#upload_records'
  get 'patients/download_records', to: 'patients#download_records'
  post 'patients/download_records', to: 'patients#download_records'


  get "/reports/providers", to: "reports#providers"
  get "/reports/snapshot", to: "reports#snapshot"
  get "/reports/capacity", to: "reports#capacity"
  get "/reports/uptake", to: "reports#uptake"
  get "/reports/locations", to: "reports#locations"
  get "/reports/employers", to: "reports#employers"
  get "/reports/supply_inventories", to: "reports#supply_inventories"
  get "/reports/customized", to: "reports#customized"
  get "/reports/news_and_notifications", to: "reports#news_and_notifications"

  namespace :reports do
    get "providers_by_county"
    get "providers_by_specialty"
    get "uptake_by_zip_code"
    get "available_and_completed_appointments"
    get "employers_state"
    get "employers_patients_tested_company_name"
    get "employers_patients_tested_city"
    get "available_appointments_by_county"
    get "completed_appointments_by_county"
    get "snapshot_tested"
    get "supply_inventories_by_county"
    get "supply_inventories_by_venue_name"
    get "appointments_by_county"
    get "available_and_completed_appointments_by_county"
    get "capacity_available_testing_appointments"
    get "capacity_scheduled_appointments"
    get "capacity_available_testing_appointments_by_county"
    get "capacity_scheduled_appointments_by_county"
    get "news_signups_by_occupation"
    get "news_signups_with_chronic_health_condition"
  end

  namespace :public do
    resources :news_signups, only: [:new, :create]
  end

  resources :patients
  get :invite_patient_to_register, to: 'patients#invite_patient_to_register', as: :invite_patient_to_register
  resources :clinics, only: [:index, :new, :create, :edit, :update] do
    get :activity
    get :report
    get :edit_queue
    patch :update_queue
    resources :patients
    resources :queued_patients do
      member do
        post :update_status
      end
      collection do
        post :send_check_in_reminders
        post :send_check_in_reminder
        post :update_clinic_status
        get  :cancel_appointment
      end
    end
  end
  resources :customized_reports
  resources :clinic_events
  resources :supply_inventories
  resources :supply_inventory_events
  resources :test_kits
  resources :provider_enrollments
  resources :providers
  resources :news_signups
  resources :messages, only: [:new, :create]
  resources :employers, only: [:index, :new, :create, :destroy] do
    member do
      get :activity
    end
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'public_portal#index'
end
