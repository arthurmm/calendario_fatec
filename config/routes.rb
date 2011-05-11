Aps3::Application.routes.draw do

  devise_for :users

  match '/criar_usuario', :controller => 'users', :action => 'create'
  match '/atualizar_usuario/(:id)', :controller => 'users', :action => 'update'

  root :to => 'relatorios#tipo_situacao'
  get "clientes/index"
  get "home/index"
  get "users/index"

  get "clientes/search"
  get "clientes/search_do"
  get "ordem_servico/search"
  get "ordem_servico/search_do"

  get "relatorios/intervalo_valor_servico"
  get "relatorios/tipo_equipamento"
  get "relatorios/tipo_situacao"
  get "relatorios/tipo_pedido"
  get "relatorios/index"

  resources :clientes do
    resources :contato
    resources :ordem_servico
    resources :documento_federal
  end

  resources :tipo_equipamento
  resources :group
  resources :users
  resources :ordem_servico

  devise_for :users, :path => "usuarios", :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock', :registration => 'register', :sign_up => 'cmon_let_me_in' }

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

