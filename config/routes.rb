Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/' => 'welcome#index'
  get '/' => 'artists#show_default'
  get '/artists' => 'artists#index', as: 'artists'
  get '/artists/:id' => 'artists#show'
  get 'artists/:id/schedule' => 'artists#schedule'

  # Sessions
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
