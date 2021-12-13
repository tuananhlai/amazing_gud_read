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

  resources :genres do
    resources :genre_books, path: :books, only: [:index]
  end

  resources :authors do
    resources :author_books, path: :books, only: [:index]
  end

  scope :admin do
    # resources :authors
    resources :books
    resources :genres
    resources :reviews
    resources :users
  end
end
