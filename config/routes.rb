Rails.application.routes.draw do
  devise_for :doctors
  root 'home#index'
  resources :doctors, only: [:show, :edit, :update] do
    get 'create_patient', on: :member
    post 'create_patient', on: :member
    get 'patient_info', on: :member
    get 'book_appintment', on: :member
    post 'create_appointment', on: :member
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
