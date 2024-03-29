ActionController::Routing::Routes.draw do |map|
  map.resources :ordems

  map.resources :equipamentos

  map.resources :funcionarios

  map.resources :clientes

  map.resources :produto_processos

  map.resources :processos

  map.resources :produtos


  map.resources :users

  # The priority is based upon order of creation: first created -> highest priority.
  # Sample of regular route:
  # map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  # map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # You can have the root of your site routed by hooking up ''
  # -- just remember to delete public/index.html.
  # map.connect '', :controller => "welcome"

  # Allow downloading Web Service WSDL as a file with an extension
  # instead of a file named 'wsdl'
  map.index 'pcp4erp', :controller => 'login', :action => 'index'
  map.connect ':controller/service.wsdl', :action => 'wsdl'
  map.index 'pcp', :controller => 'login', :action => 'index'
  map.index 'restart_db', :controller => 'application', :action => 'restart_db'
  # Install the default route as the lowest priority.
  map.connect ':controller/:action/:id.:format'
  map.connect ':controller/:action/:id'
end
