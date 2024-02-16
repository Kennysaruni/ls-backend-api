Rails.application.routes.draw do
  get '/s/:slug', to: 'links#show', as: :short
end
