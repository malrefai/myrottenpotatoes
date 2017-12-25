Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :movies
  # Route that posts 'Search TMDb' form
  post '/movies/search_tmdb'
  # map '/' to be a redirect to '/movies'
  root :to => redirect('movies')
end
