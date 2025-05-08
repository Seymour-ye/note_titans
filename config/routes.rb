Rails.application.routes.draw do
  resources :blueprints
  resources :components
  get 'static_pages/home'
  get 'static_pages/temp'
  put "/blueprits/filter_update", to: "blueprints#filter_update", as: :filter_update


  resources :languages, only: [:update]

  root to: "static_pages#home"
end
