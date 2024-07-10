Rails.application.routes.draw do
  resources :blueprints
  resources :components
  get 'static_pages/home'

  resources :languages, only: [:update]

  root to: "static_pages#home"
end
