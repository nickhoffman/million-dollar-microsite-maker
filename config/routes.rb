ActionController::Routing::Routes.draw do |map|
  
  map.connect ':topic/in/:location', :controller => 'microsite', :action => 'generate' 
  
end