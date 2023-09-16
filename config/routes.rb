Rails.application.routes.draw do
  # 顧客用
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    get 'customers' => 'customers#show'
    get 'customers/edit' => 'customers#edit'
    patch 'customers' => 'customers#update'
    get 'customers/confirm' => 'customers#confirm'
    patch 'customers/withdrawal' => 'customers#withdrawal'
    resources :items, only: [:index, :show]
    resources :addresses, except: [:new, :show]
    resources :cart_items, only: [:index, :update, :destroy, :create] do
      collection do
        delete 'destroy_all'
      end
    end
    resources :orders, only: [:new, :create, :index, :show] do
      member do
        post 'confirm'
        get 'completion'
      end
    end
  end

  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root to: 'homes#top'
    resources :items, except: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    patch 'order_details/:id' => 'order_details#update'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
