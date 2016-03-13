Rails.application.routes.draw do
  devise_for :users

  root 'searches#show'

  namespace :admin do
    root 'welcome#index'

    resources :railway_stations do
      patch :update_position, on: :member
      patch :update_arrival_departure, on: :member
    end

    resources :trains do
      resources :wagons, shallow: true
    end

    resources :routes do
      resources :railway_stations_routes
    end

    resources :tickets, except: [:new, :create]
  end

  resource :search, only: [:show]
  resources :tickets, except: [:edit, :update]
  resources :trains, only: [:index, :show]
end
