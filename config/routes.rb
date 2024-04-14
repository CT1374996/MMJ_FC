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
