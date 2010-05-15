ActionController::Routing::Routes.draw do |map|
  map.resource :post_rank, :collection => {:search => :get}
  map.resource :can_pages, :collection => {:search => :get}

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  map.connect ':topic/in/:location', :controller => 'microsites', :action => 'generate' 

  map.connect ':controller/:action/:id' 
  map.connect ':controller/:action/:id.:format' 
  
end
