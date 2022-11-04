Rails.application.routes.draw do
 

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

 get 'home/about' => 'home#about'
 get 'admin/items' => 'admin#items'

 get 'admin' => 'admin/home#top'
 

 #管理者権限
 namespace :admin do
   resources :customers, only: [:index, :show, :edit, :update] do
    end
    
   resources :genres, only: [:index, :create, :update] do
   end
 end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

 # root to: "admin/homes#top"
 

