Rails.application.routes.draw do
  resources :messages
  devise_for :users
  root to: "top#index"
end
