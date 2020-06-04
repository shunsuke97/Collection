Rails.application.routes.draw do
  # deviseのregistrations_controllerにusers/registrations_controllerを参照させる
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  root "top#index"
  get 'users/:id', to: 'users#show'
  resources :posts do
    resources :comments, only: [:create]
  end
end
