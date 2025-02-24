Rails.application.routes.draw do
  devise_for :users
  resources :projects
  #get "projects/index"
  root 'home#index'

  get "up" => "rails/health#show", as: :rails_health_check

end