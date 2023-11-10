# frozen_string_literal: true

Standards::Engine.routes.draw do
  get '/hc' => 'healthcheck#index', as: 'healthcheck'
end
