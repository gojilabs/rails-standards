Standards::Engine.routes.draw do
  get '/hc' => 'healthcheck#index', as: 'healthcheck'
end
