Rails.application.routes.draw do
 
get 'searchpeople/search'

root 'users#start'


  resources :keywords
get 'bing/index'
post 'bing/index' => 'bing#search'
get 'bing/show'
  resources :users
get 'users/start' => 'users#index'
get 'users/index' => 'searchpeople#search'
post 'searchpeople/search' => 'searchpeople#display'
get "searchpeople/display" => 'users#create_twitter_user'



     end

