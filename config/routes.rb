Rails.application.routes.draw do
  devise_for :users
  get 'posts/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :posts do
    resources :comments
  end

  root 'posts#index'
end
