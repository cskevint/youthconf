Youthconf::Application.routes.draw do
  resources :conferences

  root :to => 'conferences#index'
end
