require 'sidekiq/web'

Rails.application.routes.draw do
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  mount SimpleDiscussion::Engine => "/forum"

  devise_for :users
  root to: 'home#index'
end
