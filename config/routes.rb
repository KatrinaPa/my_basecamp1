Rails.application.routes.draw do
  resources :projects do
    member do
      get :manage_members
      post :add_member
      patch :update_member
      delete :remove_member
    end
  end

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    passwords: "users/passwords",
    confirmations: "users/confirmations",
    unlocks: "users/unlocks"
  }

  resources :users, only: [ :index ] do
    member do
      patch :make_admin
      patch :remove_admin
    end
  end

  get "home/index"
  get "up" => "rails/health#show", as: :rails_health_check
  root to: "home#index"
end
