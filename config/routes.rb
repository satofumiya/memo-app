Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'

  namespace :api, format: 'json' do
    resources :memos, only: [:index, :create]
  end
end
