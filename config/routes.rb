Rails.application.routes.draw do
  devise_for :installs
  root "top#index"
  resources :posts, only: :index
end
