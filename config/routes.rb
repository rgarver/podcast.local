ActionController::Routing::Routes.draw do |map|
  map.resources :podcasts, :has_many => :episodes
  map.root :controller => 'podcasts'
end
