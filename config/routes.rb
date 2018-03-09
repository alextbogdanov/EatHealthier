Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: "registrations" }

  # Set root link
  authenticated :user do
    root 'dashboard#index', as: :authenticated_root
  end

  root 'welcome#index'

  # set root dashboard link
  get 'dashboard', to: 'dashboard#index'

  resources :meals

  resources :foods

  resources :users

  resources :goals

  resources :recipes

  # Redirect to root_path if no route matches
  match "*path" => redirect("/"), via: [:get, :post]
end
