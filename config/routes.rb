Rails.application.routes.draw do

  # 配送先情報
  namespace :public do
    get 'addresses/index'
    get 'addresses/edit'
  end

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
    get 'customers/show'
    get 'customers/edit'
    get 'customers/check'
  end


  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  # 会員側のルーティング設定
  scope module: :public do
    root to: 'homes#top'
    get 'homes/about' => 'homes#about'

    # 商品ページを作成する際に必要
    resources :items, only: %i[index show]
  end


  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
end
