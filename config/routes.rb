Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Routes for the default artist/user for the instance of the application
  get '/' => 'artists#show_default'
  get '/bio' => 'artists#show_default_bio'
  get '/resume' => 'artists#show_default_resume'
  get '/listen' => 'artists#show_default_media'
  get '/contact' => 'artists#show_default_contact'
  # get '/schedule' => 'artists#show_default_schedule'
  get '/artists' => 'artists#index', as: 'artists'
  get '/artists/new' => 'artists#new'
  get '/artists/:id' => 'artists#show'
  get '/artists/:id/schedule' => 'artists#schedule'
  post '/artists/new' => 'artists#create'
  get '/artists/:id/edit' => 'artists#edit', as: 'artists_edit'
  put '/artists/:id' => 'artists#update'
  delete '/artists/:id' => 'artists#delete', as: 'artists_delete'

  # Welcome
  get '/welcome' => 'welcome#index'


  # Sessions
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
