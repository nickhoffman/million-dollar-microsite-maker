ActionController::Routing::Routes.draw do |map|
  
  map.connect ':topic/in/:location', :controller => 'microsites', :action => 'generate' 
  
end