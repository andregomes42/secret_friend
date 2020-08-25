require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  #mount Sidekiq::Web => '/sidekiq'

  resources :campaigns, except: [:new] do 
    post 'raffle', on: :member 
    #* other option to route
    # post 'raffle', on: :colection
  end

  get 'members/:token/opened', to: 'member#opened'
  resources :members, only: [:create, :destroy, :update]

  root to: 'pages#home'
end
