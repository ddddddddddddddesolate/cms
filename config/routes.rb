# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for "User", at: "auth"
      resources :playlists
      resources :events do
        resources :displays
      end
    end
  end
end
