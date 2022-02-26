Rails.application.routes.draw do
  devise_for :users
  
  authenticated :user do
    root 'groups#index', as: :authenticated_root
  end

  unauthenticated :user do
    root to: 'splashes#index'
  end

  resources :splashes, only: [:index]
  resources :users
  resources :groups, except: [:edit, :update] do
    resources :entities, except: [:edit, :update]
  end
end
