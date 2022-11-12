Rails.application.routes.draw do
  
# ユーザー用
  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  

 scope module: :public do
   root to: 'homes#top'
   get 'mypage' => 'users#mypage', as: 'mypage'
   resources :users, only:[:edit,:update,:show] do
   collection do
          get 'unsubscribe'
          patch 'withdraw'
        end
   end
   resources :rooms, only:[:show,:index,:create]
   resources :work_experiences, only:[:show,:create,:edit,:update]
   resources :messages, only:[:create,:destroy,:update]
   resources :certifications, only:[:show,:show]
   resources :profiles, only:[:new,:create,:edit,:update,:show,:index]  do
    resource :follows, only:[:create,:destroy]
    resources :comments, only:[:create,:destroy]
   end  
 end
# フォローとコメントはプロフィールに対して行うため、親子関係にルーティングを設定した 
# いいね！機能の作り方　参考　https://qiita.com/RIN_HM/items/968abd9e31df6631a3ed
 
 # Admin用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
 
 namespace :admin do
  root to: 'homes#top' ,as: 'top'
  get 'mypage' => 'users#index', as: 'mypage'
  resources :users, only:[:show,:edit,:update] do
   collection do
          patch 'withdraw'
        end
       end
  resources :certifications, only: [:create,:update,:show,:edit]
 end
 
 
#共通
  get 'searches/result'
  get 'searches/search'

   

  # namespace :admin do
  #   get 'users/show'
  #   get 'users/edit'
  # end
  # namespace :public do
  #   get 'rooms/show'
  #   get 'rooms/index'
  # end
  # namespace :public do
  #   get 'work_experiences/edit'
  #   get 'work_experiences/show'
  # end
  # namespace :public do
  #   get 'profiles/new'
  #   get 'profiles/edit'
  # end
  # namespace :public do
  #   get 'users/show'
  # end
  # namespace :public do
  #   get 'homes/top'
  # end
  # devise_for :admins
  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
 
  
end