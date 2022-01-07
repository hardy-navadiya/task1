Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  get 'home/error'
  delete 'destroyclient' => 'clients#destroy'
  delete 'destroyinvoice' => 'invoices#destroy'


  root 'home#index'

  resources :clients
  resources :invoices
end
