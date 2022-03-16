Rails.application.routes.draw do
  namespace :admins do
    get 'order_details/update'
  end
  namespace :admins do
    get 'orders/show'
    get 'orders/update'
  end
  namespace :admins do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
  end
  namespace :admins do
    get 'genres/index'
    get 'genres/create'
    get 'genres/edit'
    get 'genres/update'
  end
  namespace :admins do
    get 'items/index'
    get 'items/new'
    get 'items/create'
    get 'items/show'
    get 'items/edit'
    get 'items/update'
  end
  namespace :admins do
    get 'homes/top'
  end
  namespace :end_users do
    get 'addresses/index'
    get 'addresses/edit'
    get 'addresses/create'
    get 'addresses/update'
    get 'addresses/destroy'
  end
  namespace :end_users do
    get 'orders/new'
    get 'orders/comfilm'
    get 'orders/complete'
    get 'orders/create'
    get 'orders/index'
    get 'orders/show'
  end
  namespace :end_users do
    get 'cart_items/index'
  end
  namespace :end_users do
    get 'users/show'
    get 'users/edit'
    get 'users/update'
    get 'users/unsubscribe'
    get 'users/withdraw'
  end
  namespace :end_users do
    get 'registrations/new'
    get 'registrations/create'
  end
  namespace :end_users do
    get 'items/index'
    get 'items/show'
  end
  namespace :end_users do
    get 'homes/top'
    get 'homes/about'
  end
  devise_for :admins
  devise_for :end_users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
