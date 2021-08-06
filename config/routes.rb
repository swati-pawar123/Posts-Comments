Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get 'posts/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
   # get '/users/sign_in' => 'devise/sessions#new'
  end

  resources :posts do
    resources :comments
  end

  root 'posts#index'

end
