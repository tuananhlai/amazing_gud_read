Rails.application.routes.draw do
  root "static_pages#home"

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"
  
  get "log_in", to: "sessions#new"
  post "log_in", to: "sessions#create"
  delete "/log_out", to: "sessions#destroy"

  resources :user_books, path: :books
  resources :user_reviews, path: :reviews do
    resources :likes
    resources :reports
  end

  scope :admin do
    resources :authors
    resources :books
    resources :genres
  end
end
