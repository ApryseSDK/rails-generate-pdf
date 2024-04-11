Rails.application.routes.draw do
    root 'invoices#index'

   resources :invoices, only: [:index, :show]
    get 'invoices/index'
    get 'invoices/show'
end

