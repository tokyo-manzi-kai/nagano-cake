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
    resources :orders, only: [:show, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    get 'homes/top'
  end

  # 顧客
  scope module: :end_users do
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :orders, only: [:new, :create, :index, :show] do
      collection do
        post 'orders/comfilm'
        get 'orders/complete'
      end
    end
    resources :cart_items, only: [:index]
    resource :users, only: [:edit, :update] do
      collection do
        get '/my_page' => "users#show"
        get 'users/unsubscribe'
        patch 'users/withdraw'
      end
    end
    resources :registrations, only: [:new, :create]
    resources :items, only: [:index, :show]
    root to: 'homes#top'
    get 'homes/about'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
