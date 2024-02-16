Rails.application.routes.draw do
  # Route for creating a new link
  post '/s', to: 'links#create'

  #Route to get all Urls
  get '/s', to: 'links#index'

  # Route for accesing a link that already exists
  get '/s/:slug', to: 'links#show', as: :short

  # Route for deleting an elready existing link
  delete '/s/:slug', to: 'links#destroy'


end
