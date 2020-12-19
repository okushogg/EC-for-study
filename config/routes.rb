Rails.application.routes.draw do
  namespace :public do
    resources :items, only:[:index,  :show]
  end
  # 管理者が見る商品情報
  namespace :admins do
    resources :items, only:[:index, :new, :create, :show, :edit, :update, :destroy]
  end

  #管理者が見る商品ジャンル
  namespace :admins do
    resources :genres, only:[:index, :create, :edit, :update, :destroy]
  end

  # 管理者が見る利用者情報
  namespace :admins do
    resources :customers, only:[:index, :show, :edit, :update]
  end

  get 'admin' => 'admins/homes#top'

  # 管理者namespace
  devise_for :admin, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  # resources :admins, only: [:new]

  # devise_for :customers

  root to: 'public/homes#top'

# 12/14種坂　下記、namespace実装で不要になるかもしれません
# また、新規登録画面のみの記載です。ログイン、ログアウトはなぜか指定せずとも動きました。
  # get 'customers/sign_up' => 'customers/registrations#new'
  # 利用者namespace
  devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}
# 下記resources :customers, only:[:show, :edit, :update]はdevise_for :customersより下に記載をお願い致します。12/17タネサカ
namespace :public do
resources :customers, only:[:show, :edit, :update] do
    member do
            get "unsubscribe"
            #ユーザーの会員状況を取得
            patch "withdrawl"
            #ユーザーの会員状況を更新
        end
      end
end

  # 配送先
  scope module: :public do
    resources :addresses, only:[:index, :create, :edit, :update, :destroy]
  end


end