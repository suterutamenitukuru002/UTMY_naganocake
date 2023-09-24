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
    get 'orders/complete'
    post 'orders/create'
    post 'orders/check'
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


    # 商品ページを作成する際に必要
    resources :items, only: %i[index show]
    resources :addresses,only: [:index,:create,:edit,:update,:destroy]

    # カートページ作成
    delete :cart_items, to: 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :create, :destroy, :update]

    get '/genre/search' => 'searches#genre_search'
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
    root to: 'homes#top'
  end
  namespace :admin do
    get 'orders/show'
  end
  namespace :admin do
    resources :customers, only: [:index, :edit, :show, :update]
  end

end
