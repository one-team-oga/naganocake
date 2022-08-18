Rails.application.routes.draw do
  
  root to: 'public/homes#top'
  
  namespace :admin do
    resources :orders, only: [:show,:update]
  end
  
  namespace :admin do
    resources :ordering_details, only: [:update]
  end
  
  namespace :admin do
    resources :customers, only: [:index,:show,:edit,:update]
  end
  
  namespace :admin do
    resources :genres, only: [:index,:create,:edit,:update]
  end
  
  namespace :admin do
    resources :items, only: [:index,:new,:show,:edit,:create,:update]
  end
  
  namespace :admin do
    root to: 'homes#top'
  end
  
  namespace :public do
    resources :addresses, only: [:index,:edit,:create,:update,:destroy]
  end
  
  namespace :public do
    resources :orders, only: [:new,:index,:show,:create]
    post '/orders/confirm' => 'orders#confirm'
    get 'orders/complete'
  end
  
  namespace :public do
    resources :cart_items, only: [:index,:update,:destroy,:create]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
  end
  
  namespace :public do
    get 'customers/my_page' => 'customers#show', as: 'my_page'
    get 'customers/information/edit' => 'customers#edit', as: 'information_edit'
    patch  'customers/infomation' => 'customers#update', as: 'information_update'
    get 'customers/unsubcribe' => 'customers#unsubcribe'
    get 'customers/withdraw' => 'customers#withdrow'
  end
  
  namespace :public do
    resources :items, only: [:index,:show]
  end
  
  namespace :public do
    root to: 'homes#top'
    get 'homes/about' => 'homes#about', as: 'about'
  end
  
 # 顧客用
 # URL /customers/sign_in ...
 devise_for :customers, skip: [:passwords], controllers: {
   registrations: "public/registrations",
   sessions: 'public/sessions'
 }

 # 管理者用
 # URL /admin/sign_in ...
 devise_for :admin, skip: [:registrations, :passwords], controllers: {
   sessions: "admin/sessions"
 }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
