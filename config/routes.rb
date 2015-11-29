Rails.application.routes.draw do
  resources :messages
  root 'welcome#index'

  # Example of regular route:
  get 'login' => 'login#index'
  get 'feed' => 'facebook#feed'
  post 'status' => 'facebook#status'
  get 'stocks' => 'stocks#index'
  get 'stocks/stock' => 'stocks#stock'
  #stock transaction button links to the stock_transaction method in the controller
  #post "stocks/stock" => "stocks#stock_transaction"
  match "stocks/stock" => "stocks#stock", via: :post
  get 'stocks/data'
  get 'calendar' => 'calendar#index'
  get 'events' => 'events#index'
  get 'downloadMessage' => 'messages#download', :defaults => { :format => 'txt' }

  resources :events

  # Facebook callback
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

end
