Rails.application.routes.draw do
  get "daily_tasks/index"
  resources :journal_entries
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "auth#log_in"
  get "auth/sign_up"
  post "auth/create_or_login_user", as: :create_or_login_user
  post "auth/create_user_track"
  get "dashboard/home"
  get "dashboard/pomodoro"
  get "dashboard/new_goal"
  post "dashboard/create_goal"
  post "auth/create_saga", as: :create_saga
  resources :workouts do
    post "add_lift_form", on: :collection, as: :add_lift_form
    delete "delete_lift_form", on: :collection, as: :delete_lift_form
    get "list", on: :collection
    post "add_lift_to_workout", on: :member
  end
  resources :daily_tasks do
    post "add_task", on: :collection, as: :add_task
  end
end
