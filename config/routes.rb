Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  delete 'destroyclient' => 'clients#destroy'

  root 'home#index'

  resources :clients
end
