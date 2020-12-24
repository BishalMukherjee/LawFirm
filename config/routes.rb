Rails.application.routes.draw do
  root "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "auth/google_oauth2/callback", to: "session#create"

  delete "sign_out", to: "session#destroy"

  resources :users, :clients, :services, :billings
end
