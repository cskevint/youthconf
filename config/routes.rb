Youthconf::Application.routes.draw do

  resources :posts


  resources :users

  resources :conferences do
    member do
      get 'attending'
    end
  end

  resources :sessions, :only => [:new, :create]

  match "/register" => "users#new", :as => :register

  match "/login" => "sessions#new", :as => :login
  match "/logout" => "sessions#destroy", :as => :logout

  root :to => 'conferences#index'
end
