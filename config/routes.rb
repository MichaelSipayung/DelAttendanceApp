Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'show' => 'sessions#show'
  delete 'logout' => 'sessions#destroy'
  resources :hrdx_pegawais
  resources :attendance_sessions
  resources :attendance_logs, only: [:create]
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  root 'sessions#new'
  # Defines the root path route ("/")
  # root "posts#index"
  resources :students, only: [:index]
end
