Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'artists#show_default'
  get '/bio' => 'artists#show_default_bio'
  get '/resume' => 'artists#show_default_resume'
  get '/listen' => 'artists#show_default_media'
  get '/contact' => 'artists#show_default_contact'
  # get '/schedule' => 'artists#show_default_schedule'
  get '/artists' => 'artists#index', as: 'artists'
  get '/artists/:id' => 'artists#show'
  get 'artists/:id/schedule' => 'artists#schedule'

  # Welcome
  get '/welcome' => 'welcome#index'


  # Sessions
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
