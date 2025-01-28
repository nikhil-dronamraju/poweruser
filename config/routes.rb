Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "auth#sign_up"
  post "auth/create_or_login_user", as: :create_or_login_user
  get "dashboard/home"
  get "dashboard/fitness_tracking"
  get "dashboard/new_workout"
  post "dashboard/create_workout"
  post "dashboard/add_lift_to_workout"
  post "dashboard/delete_lift_from_workout"
end
