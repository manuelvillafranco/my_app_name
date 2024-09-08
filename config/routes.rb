Rails.application.routes.draw do
  get "registrations/new"
  get "registrations/create"
  get "protected/show"
  get "sessions/new"
  get "sessions/create"
  get "home/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
  root 'home#index'
  get 'login', to: 'sessions#new'     # Ruta para mostrar el formulario de login
  post 'login', to: 'sessions#create' # Ruta para procesar el login
  delete 'logout', to: 'sessions#destroy' # (Opcional) para cerrar sesión más adelante
  get 'protected', to: 'protected#show'
  get 'signup', to: 'registrations#new'
  post 'signup', to: 'registrations#create'
end
