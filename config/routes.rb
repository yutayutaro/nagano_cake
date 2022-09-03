Rails.application.routes.draw do
  get 'public/orders'
# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  scope module: :public do    
    resources :homes
    resources :items
    resources :registrations

    resources :customers
    resources :cart_items
    resources :orders
    resources :addresses
    root to: "homes#top"
  get '/about'=>"homes#about"
  get '/customers/confirmation'=>"customers#confirmation" 
  patch '/customers/withdraw'=>"customers#withdraw" 
  delete '/cart_items/destroy_all'=>"customers#destroy_all"
  post  '/orders/confirmation'=>"orders#confirmation"
  get   '/orders/completion'=>"orders#completion"
end
    namespace :admin do
    resources :items
    resources :genres
    resources :customers
    resources :orders
    resources :orders_details
   root "homes#top"
  
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
