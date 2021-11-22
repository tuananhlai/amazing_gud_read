Rails.application.routes.draw do
  root "static_pages#home"
  get "log_in", to: "sessions#new"
end
