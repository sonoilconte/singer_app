Rails.application.routes.draw do

  # Lockup gem for managing access to demo site
  # mount Lockup::Engine, at: '/lockup'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Routes for the default artist/user for the instance of the application
  # visible to the end user
  # Sessions
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/' => 'artists#show_default'
  get '/:path' => 'artists#show_default'

  # Routes for administrator managing content
  get '/artists/new' => 'artists#new'
  post '/artists/new' => 'artists#create'
  get '/artists/:id' => 'artists#show'
  get '/artists' => 'artists#index', as: 'artists'
  get '/artists/:id/edit' => 'artists#edit', as: 'artists_edit'
  put '/artists/:id' => 'artists#update'
  delete '/artists/:id' => 'artists#delete', as: 'artists_delete'
  delete 'artists/:id/attachments/:image_id' => 'artists#delete_image'

  # Routes for administration of images associated with artist
  get '/artists/:id/images/new' => 'images#new'
  post '/artists/:id/images/new' => 'images#create'
  get '/artists/:id/images/:image_id' => 'images#show'
  get '/artists/:id/images' => 'images#index'
  get '/artists/:id/images/:image_id/edit' => 'images#edit'
  put '/artists/:id/images/:image_id' => 'images#update'
  delete '/artists/:id/images/:image_id' => 'images#delete'

  get '/artists/:id/events/new' => 'events#new'
  post '/artists/:id/events/new' => 'events#create'
  get '/artists/:id/events/:event_id' => 'events#show'
  get '/artists/:id/events' => 'events#index'
  get '/artists/:id/events/:event_id/edit' => 'events#edit'
  put '/artists/:id/events/:event_id' => 'events#update'
  delete '/artists/:id/events/:event_id' => 'events#delete'

  # Welcome
  get '/welcome' => 'welcome#index'
end
