Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Routes for the default artist/user for the instance of the application
  # visible to the end user
  get '/' => 'artists#show_default'
  get '/bio' => 'artists#show_default_bio'
  get '/schedule' => 'artists#show_default_schedule'
  get '/resume' => 'artists#show_default_resume'
  get '/listen' => 'artists#show_default_media'
  get '/gallery' => 'artists#show_default_images'
  get '/contact' => 'artists#show_default_contact'

  # Routes for administrator managing content
  get '/artists' => 'artists#index', as: 'artists'
  get '/artists/new' => 'artists#new'
  get '/artists/:id' => 'artists#show'
  get '/artists/:id/schedule' => 'artists#schedule'
  post '/artists/new' => 'artists#create'
  get '/artists/:id/edit' => 'artists#edit', as: 'artists_edit'
  put '/artists/:id' => 'artists#update'
  delete '/artists/:id' => 'artists#delete', as: 'artists_delete'
  delete 'artists/:id/attachments/:image_id' => 'artists#delete_image'

  # Welcome
  get '/welcome' => 'welcome#index'

  # Sessions
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
