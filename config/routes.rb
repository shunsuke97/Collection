Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root "top#index"
  resources :posts do
    resources :comments, only: [:create]
  end
end
