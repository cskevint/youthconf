Youthconf::Application.routes.draw do
  resources :users

  resources :conferences

  resources :sessions, :only => [:new, :create]

  match "/logout" => "sessions#destroy", :as => :logout

  root :to => 'conferences#index'
end
