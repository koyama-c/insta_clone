Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    root to: 'devise/registrations#new'
  end
  resources :users,   only: [:index, :show]
  resources :posts,   only: [:create, :destroy]  
  get  '/home',        to: 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get 'pages/index'
  get 'pages/show'

end
