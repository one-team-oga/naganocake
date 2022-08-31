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
  
  scope module: :public do
    resources :addresses, only: [:index,:edit,:create,:update,:destroy]
  end
  
  scope module: :public do
    get 'orders/complete' => 'orders#complete'
    post 'orders/confirm' => 'orders#confirm'
    resources :orders, only: [:new,:index,:show,:create]
    
    
  end

  scope module: :public do
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index,:update,:destroy,:create]
  end
  
    get 'customers/my_page' => 'public/customers#show', as: 'my_page'
    get 'customers/information/edit' => 'public/customers#edit', as: 'information_edit'
    patch  'customers/information' => 'public/customers#update', as: 'information_update'
    get 'customers/unsubcribe' => 'public/customers#unsubcribe'
    patch 'customers/withdraw' => 'public/customers#withdraw'
    
   scope module: :public do
   resources :items, only: [:index,:show]
   end

    get 'homes/about' => 'public/homes#about', as: 'about'

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
