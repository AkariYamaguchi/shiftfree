# frozen_string_literal: true

Rails.application.routes.draw do
  resources :comments
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root 'shift_users#index'
  resources :shift_users
  resources :comments do
    resources :likes, only: [:create]
  end

  # registrations_controller.rbを使える設定
  devise_for :users, controllers: { registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks' }

  get 'users' => 'user#index'
  get 'users/show' => 'user#show'
  get 'users/:id/edit' => 'user#edit'
  post 'users/:id/update' => 'user#edit'
end
