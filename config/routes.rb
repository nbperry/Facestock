Rails.application.routes.draw do
  root 'welcome#index'

  # Example of regular route:
  get 'login' => 'login#index'
  get 'feed' => 'facebook#feed'
  post 'status' => 'facebook#status'
  get 'stocks' => 'stocks#index'
  get 'stocks/stock'
  get 'stocks/data'
  get 'calendar' => 'calendar#index'
  get 'events' => 'events#index'

  resources :events

  # Facebook callback
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

end
