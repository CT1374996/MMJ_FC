Rails.application.routes.draw do
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  scope module: :public do
    root to: "homes#top"
    get '/メンバー紹介' => 'members#index', as: '/members_index'
    get '/花里みのり' => 'members#minori_hanasato', as: '/members_minori_hanasato'
    get '/桐谷遥' => 'members#haruka_kiritani', as: '/members_haruka_kiritani'
    get '/桃井愛莉' => 'members#airi_momoi', as: '/members_airi_momoi'
    get '/日野森雫' => 'members#shizuku_hinomori', as: '/members_shizuku_hinomori'
    resources :information, only: [:index, :show]
    resources :blogs, only: [:index, :show]
  end
  namespace :admin do
    root to: "homes#top"
    resources :information
    resources :blogs
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
