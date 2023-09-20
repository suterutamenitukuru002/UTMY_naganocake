Rails.application.routes.draw do

  # 配送先情報
  # namespace :public do
  #   # get 'addresses/index'
  #   # get 'addresses/:id/edit',to: 'addresses#edit'
  #   # patch 'addresses/:id', to: 'addresses#update'
  #   # post 'addresses/create'
  #   # delete '/addresses/:id', to: 'addresses#destroy'
  # end

  # 注文情報
  namespace :public do
    get 'orders/new'
    get 'orders/index'
    get 'orders/show'
    get 'orders/check'
    get 'orders/complete'
  end

  # カート内商品
  namespace :public do
    get 'cart_items/index'
  end

  # 顧客情報ページ
  namespace :public do
    get 'customers/mypage'
    get 'customers/edit'
    get 'customers/check'
    patch 'customers/is_withdraw'
    patch 'customers/infomation'
  end



  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  # 会員側のルーティング設定
  scope module: :public do
    root to: 'homes#top'
    get 'homes/about' => 'homes#about'

    resources :addresses,only: [:index,:create,:edit,:update,:destroy]
  end


  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  namespace :admin do
   resources :items, only: [:index, :show, :new, :edit, :create, :update]
  end

  namespace :admin do
    resources :genres, only: [:index, :edit, :create, :update]
  end

  namespace :admin do
    get 'homes/top'
  end
  namespace :admin do
    get 'orders/show'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
end
