Rails.application.routes.draw do
  root "short_urls#index" 
  resources :short_urls, only: [:new, :create, :index]
  get "/:short_code", to: "short_urls#redirect"
end
