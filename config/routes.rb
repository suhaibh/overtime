Rails.application.routes.draw do
  
  resources :audit_logs, except: [:new, :edit, :destroy] do
    member do
      put "confirm", to: "audit_logs#confirm"
    end
  end
  
  namespace :admin do
    resources :users
  	resources :posts
  	resources :admin_users
    resources :employees

    root to: "users#index"
  end

  resources :posts do
    member do
      put "approve", to: "posts#approve"
    end
  end
  
  devise_for :users, skip: [:registrations]
  root 'static#homepage'

end
