Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'shorten_urls#new'

  scope module:  'api' do
    scope module: 'v1' do
      get '/*path', to: 'shorten_urls#redirect'
      resources :shorten_urls, only: [:create]
      post '/top_most_url', to: 'shorten_urls#top_most_url'
    end
  end
end
