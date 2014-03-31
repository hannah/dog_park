DogPark::Application.routes.draw do
  root to: 'dog_registrations#index'
  resources :dog_registrations, only: [:index, :new, :create]
end
