Rails.application.routes.draw do
  root 'standups#index'

  resources :employees, only: [:index, :new, :create, :update]
  resources :standups, only: [:index, :new, :create]
  resources :employee_standups, only: [:create]
end
