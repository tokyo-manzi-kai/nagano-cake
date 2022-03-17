Rails.application.routes.draw do

  #管理者
  # カリキュラム  実装のヒント
  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admins/sessions"
}
  #顧客側
  # カリキュラム  実装のヒント
  devise_for :end_users,skip: [:passwords], controllers: {
  registrations: "end_users/registrations",
  sessions: 'end_users/sessions'
}

  #管理者
  namespace :admins do
    resources :order_details, only: [:update]
    # get 'order_details/update'
    resources :orders, only: [:show, :update]
    # get 'orders/show'
    # get 'orders/update'
     resources :customers, only: [:index, :show, :edit, :update]
    # get 'customers/index'
    # get 'customers/show'
    # get 'customers/edit'
    # get 'customers/update'
    resources :genres, only: [:index, :create, :edit, :update]
    # get 'genres/index'
    # get 'genres/create'
    # get 'genres/edit'
    # get 'genres/update'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    # get 'items/index'
    # get 'items/new'
    # get 'items/create'
    # get 'items/show'
    # get 'items/edit'
    # get 'items/update'
    get 'homes/top'
  end

  # 顧客
  scope module: :end_users do
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    # get 'addresses/index'
    # get 'addresses/edit'
    # get 'addresses/create'
    # get 'addresses/update'
    # get 'addresses/destroy'
    resources :orders, only: [:new, :create, :index, :show] do
      collection do
        post 'orders/comfilm'
        get 'orders/complete'
      end
    end
    # get 'orders/new'
    # get 'orders/create'
    # get 'orders/index'
    # get 'orders/show'
    resources :cart_items, only: [:index]
    # get 'cart_items/index'
    resources :users, only: [:show, :edit, :update] do
      collection do
        get 'users/unsubscribe'
        patch 'users/withdraw'
      end
    end
    # get 'users/show'
    # get 'users/edit'
    # get 'users/update'
    resources :registrations, only: [:new, :create]
    # get 'registrations/new'
    # get 'registrations/create'
    resources :items, only: [:index, :show]
    # get 'items/index'
    # get 'items/show'
    root to: 'homes#top'
    get 'homes/about'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
