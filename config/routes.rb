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
 # get 'admin/items' => 'admin#items'
 # get 'admin/genres/:id/edit' => 'admin/genres#edit'

 get 'admin' => 'admin/home#top'
 # get '/admin/items/:id', to: 'admin#items'
 
 # get '/customers/sign_out' => 'devise/sessions#destroy'


 #管理者権限
 namespace :admin do
   resources :customers, only: [:index, :show, :edit, :update] do
    end

   resources :genres, only: [:index, :edit, :create, :update] do
   end

   resources :items,only: [:new, :index, :show, :edit, :create, :update] do
   end
 end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

 
 # root to:"homes#top"


