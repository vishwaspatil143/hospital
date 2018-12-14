Rails.application.routes.draw do
  devise_for :doctors
  root 'home#index'
  resources :doctors, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
