Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', passwords: "passwords" }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'home#index'

  get "schools",  to: "schools#index"
  get "schools/index_data",  to: "schools#index_data"
  get "schools/show_data",  to: "schools#show_data"
  get "schools/:id",  to: "schools#show"

  get "universitys", to: "universitys#index"
  get "universitys/index_data", to: "universitys#index_data"
  get "universitys/:id", to: "universitys#show"

end