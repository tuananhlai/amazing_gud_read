Rails.application.routes.draw do
  root "static_pages#home"

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"
end
