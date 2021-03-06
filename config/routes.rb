Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated do
      root to: 'home#index'
    end

    unauthenticated do
      root to: 'devise/sessions#new'
    end
  end

  resources :stores
  resources :pets
end
