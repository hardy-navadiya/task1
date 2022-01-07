Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  delete 'destroyclient' => 'clients#destroy'
  delete 'destroyinvoice' => 'invoices#destroy'

  root 'home#index'

  resources :clients
  resources :invoices
end
