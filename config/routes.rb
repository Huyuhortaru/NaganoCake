Rails.application.routes.draw do

 root to:"public/homes#top"

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

 # 顧客表示部分
 namespace :public do
   get "/" => 'homes#top'
   get 'home/about' => 'homes#about'
   get 'customers/my_page' => 'customers#show'
   get 'customers/edit' => 'customers#edit'
   get 'customers/unsubscribe' => 'customers#unsubscribe'
   patch 'customers/withdraw' => 'customers#withdraw'
   patch '/customers' => 'customers#update'
   get '/addresses' => 'addresses#index'

   resources :items, only: [:index, :show] do
   end

   resources :customers

   resources :orders, only: [:new, :index, :show, :log, :thanks, :create] do
   end

   resources :addresses, only: [:index, :edit, :create, :update, :destroy] do
   end

   resources :cart_items, only: [:index, :create, :update, :destroy, :destroy_all] do
   end

end



 #管理者権限
 namespace :admin do
   get "/" => 'homes#top'
   # get 'admin/items' => 'admin#items'
   # get 'admin/genres/:id/edit' => 'admin/genres#edit'
   # get '/admin/items/:id', to: 'admin#items'
   # get '/customers/sign_out' => 'devise/sessions#destroy'
   resources :customers, only: [:index, :show, :edit, :update] do
   end

   resources :genres, only: [:index, :edit, :create, :update] do
   end

   resources :items, only: [:new, :index, :show, :edit, :create, :update] do
   end

   resources :orders, only: [:show, :update] do
   end
 end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end



