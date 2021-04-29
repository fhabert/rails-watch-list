Rails.application.routes.draw do
  resources :lists, only: [:index, :new, :create, :show, :destroy] do
    resources :movies, only: [:new, :create]
    resources :reviews, only: [:create]
  end
end
